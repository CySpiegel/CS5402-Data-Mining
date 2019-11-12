import csv
import statistics
fields = []
rows = []
csvLocation = ("5402_dataset - Copy.csv")

r = csv.reader(open(csvLocation))
lines = list(r)

Total = 0
count = 0
AllValues = []
maxRows = 14996
#The FIT101 column    AIT202
LIT101Column = [29]
for i in LIT101Column:
	for j in range(maxRows):
		value = lines[j][i]
		if(value != "NA" and j != 0):
			value = float(value)
			while(value < 400 or value > 900):
				if(value < 400):
					value = value * 10
				if(value > 900):
					value = value / 10
				lines[j][i] = str(value)
			Total += value
			count += 1
			AllValues.append(value)

writer = csv.writer(open(csvLocation, 'w', newline = ''))
writer.writerows(lines)

print(Total)
print(count)
print(Total/count)
AllValues.sort()
Middle = len(AllValues)/2
End = len(AllValues)
Q2 = statistics.median(AllValues)
Q1 = statistics.median(AllValues[0:int(Middle)])
Q3 = statistics.median(AllValues[int(Middle):End])
print(Q1)
print(Q2)
print(Q3)





