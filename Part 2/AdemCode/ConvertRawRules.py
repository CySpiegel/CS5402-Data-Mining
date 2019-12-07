f1 = open('CleanRules.txt','w')
f2 = open('RawRules.txt', 'r')

AllLines = f2.readlines()
cleanRules = [""] * len(AllLines)
#Goes through all rules made by Weka apriori and formats
#it in a way for RuleY_E_Generator.py to recognize
for Rule in AllLines:
	List = Rule.split()
	string = "If"
	Then = False
	for i in range(len(List)):
		Part = []
		if("=" in List[i]):
			if(i == 1 or Then):
				Part = List[i].split("=")
				string = string + " " + Part[0] + " = " + Part[1]
				Then = False
			elif(List[i] != "==>"):
				Part = List[i].split("=")
				string = string + " and " + Part[0] + " = " + Part[1]
			else:
				string = string + " then"
				Then = True
	# if("is_attack" in string):	
	# 	f1.write(string + "\n")
	f1.write(string + "\n")
f1.close()
f2.close()
