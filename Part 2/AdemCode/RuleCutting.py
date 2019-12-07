import re

def remove_values(List, value):
	return[val for val in List if val != value]

f1 = open('CleanRules.txt','r')
f2 = open('UcfValuesOfYE.txt', 'r')
f3 = open('CutRules.txt', 'w')
f4 = open('FinishedRules.txt', 'w')
AllRules = f1.readlines()
AllUcf = f2.readlines()
for i in range(len(AllRules)):
	Rule = AllRules[i]
	UcfR = AllUcf[i]
	Rule = Rule.split()
	Rule.remove("If")
	# if("and" in Rule):	
	# 	Rule.remove("and")
	Rule = remove_values(Rule, "and")
	Rule.insert(Rule.index("then")+1, "fill")
	Rule.insert(Rule.index("then")+1, "fill")
	RuleList = []
	ChosenRule = 0
	for a in range(0, len(Rule), 3):
		if(Rule[a] == "then"):
			RuleList.append(Rule[a])
		else:
			RuleList.append(Rule[a] + Rule[a+1] + Rule[a+2])
	UcfR = UcfR.replace("[", "")
	UcfR = UcfR.replace("]", "")
	UcfR = UcfR.replace(",", "")
	UcfR = UcfR.split()
	DropRules = []
	for j in range(1, len(UcfR)):
		if(len(UcfR) > 2):	
			if(UcfR[j] < UcfR[0]):
				DropRules.append(j)
	for k in Rule:
		if(len(DropRules) == 1):
			ChosenRule = DropRules[0]
		elif(len(DropRules) > 1):
			ChosenRule = UcfR.index(min(UcfR))
	if(ChosenRule != 0):
		RuleList.pop(ChosenRule-1)
	FormatedRules = "If"
	for rulePos in range(len(RuleList)):
		RuleString = RuleList[rulePos]
		if("=" in RuleString):
			Location = RuleString.find("=")
			NewString = RuleString[:Location] + " " + RuleString[Location:Location+1] + " " + RuleString[Location+1:]
			RuleList[rulePos] = NewString
	for b in range(len(RuleList)):
		if(b == 0):
			FormatedRules = FormatedRules + " " + RuleList[b]
		elif(RuleList[b] == "then"):
			FormatedRules = FormatedRules + " then"
		else:
			if(RuleList[b-1] != "then"):	
				FormatedRules = FormatedRules + " and " + RuleList[b]
			else:
				FormatedRules = FormatedRules + " " + RuleList[b]
	WasCut = ""
	if(ChosenRule != 0):
		WasCut = "Was cut"
	f3.write(AllRules[i] + FormatedRules + "\t\t\t\t" + WasCut + "\n" + "\n")
	f4.write(FormatedRules + "\n")


f1.close()
f2.close()
f3.close()
f4.close()