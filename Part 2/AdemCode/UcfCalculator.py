
#The function binP and calcBin is not my code 
#but the rest is. I had to use it since I didn't
#know how to calculate Ucf() without using wolfram alpha
#Source: https://stackoverflow.com/questions
#/13059011/is-there-any-python-function-library-
#for-calculate-binomial-confidence-intervals

#Calculatee Ucf for associate rule dropping/cleaning
def binP(N, p, x1, x2):
    p = float(p)
    q = p/(1-p)
    k = 0.0
    v = 1.0
    s = 0.0
    tot = 0.0
    while(k<=N):
        tot += v
        if(k >= x1 and k <= x2):
            s += v
        if(tot > 10**30):
            s = s/10**30
            tot = tot/10**30
            v = v/10**30
        k += 1
        v = v*q*(N+1-k)/k
    return s/tot

def calcBin(vx, vN, vCL = 95):
    vx = float(vx)
    vN = float(vN)
    #Set the confidence bounds
    vTU = (100 - float(vCL))/2
    vTL = vTU
    vP = vx/vN
    if(vx==0):
        dl = 0.0
    else:
        v = vP/2
        vsL = 0
        vsH = vP
        p = vTL/100

        while((vsH-vsL) > 10**-5):
            if(binP(vN, v, vx, vN) > p):
                vsH = v
                v = (vsL+v)/2
            else:
                vsL = v
                v = (v+vsH)/2
        dl = v
    if(vx==vN):
        ul = 1.0
    else:
        v = (1+vP)/2
        vsL =vP
        vsH = 1
        p = vTU/100
        while((vsH-vsL) > 10**-5):
            if(binP(vN, v, 0, vx) < p):
                vsH = v
                v = (vsL+v)/2
            else:
                vsL = v
                v = (v+vsH)/2
        ul = v
    return (dl, ul)

f1 = open('CleanRules.txt','r')
f2 = open('Y_E_Tables.txt', 'r')
f4 = open('UcfValuesOfYE.txt', 'w')
AllRules = f1.readlines()
AllYE_Tables = f2.readlines()
count = 0
for i in range(len(AllRules)):
    count += 1
    print(count)
    Y = []
    E = []
    Y_E_Table = AllYE_Tables[i]
    New = Y_E_Table.split(', ')
    YPart = False
    EPart = False
    for j in New:
        if('[[' in j or YPart):
            YPart = True
            NewJ = j.replace("[", "")
            Y.append(int(NewJ.replace("]", "")))
        elif('[' in j or EPart):
            EPart = True
            NewJ = j.replace("[", "")
            E.append(int(NewJ.replace("]", "")))
        if(']' in j):
            YPart = False
    Total1 = Y[0] + E[0]
    UcfValue = calcBin(Y[0], Total1)
    R = []
    R.append(1 - UcfValue[0])
    for k in range(1, len(Y)):
        Total2 = Total1 + Y[k] + E[k]
        UcfValue = calcBin(Y[0] + Y[k], Total2)
        R.append(1 - UcfValue[0])
    f4.write(str(R) + "\n")

f1.close()
f2.close()
f4.close()
