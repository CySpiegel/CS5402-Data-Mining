import csv
fields = []
rows = []
csvLocation = ("updateMakeAdemHappyDataset.csv")

r = csv.reader(open(csvLocation))
lines = list(r)
maxRows = 14996

def YandE_Generator(RawRule):
	ColumnNames = []
	Sign = []
	Number = []
	ExpectName = False
	ExpectSign = False
	ExpectNumber = False
	ExpectAnd = False

	BeforeThen = 0
		
	Rule = RawRule.split()
	for i in range(len(Rule)):
		if(Rule[i] == "If"):
			ExpectName = True

		elif(Rule[i] == "and" or Rule[i] == "then" and ExpectAnd):
			ExpectName = True
			ExpectAnd = False
			if(Rule[i] == "then"):
				BeforeThen = len(ColumnNames)

		elif(Rule[i] == ">=" and ExpectSign):
			Sign.append(Rule[i])
			ExpectNumber = True
			ExpectSign = False

		elif(Rule[i] == ">" and ExpectSign):
			Sign.append(Rule[i])
			ExpectNumber = True
			ExpectSign = False

		elif(Rule[i] == "<=" and ExpectSign):
			Sign.append(Rule[i])
			ExpectNumber = True
			ExpectSign = False

		elif(Rule[i] == "<" and ExpectSign):
			Sign.append(Rule[i])
			ExpectNumber = True
			ExpectSign = False

		elif(Rule[i] == "=" and ExpectSign):
			Sign.append(Rule[i])
			ExpectNumber = True
			ExpectSign = False

		else:
			if(ExpectName):
				ColumnNames.append(Rule[i])
				ExpectName = False
				ExpectSign = True
			elif(ExpectNumber):
				Number.append(Rule[i])
				ExpectNumber = False
				ExpectAnd = True
			else:
				print("Error: Not a valid rule")
				print(RawRule)
				break

	ColumnPositions = []

	for j in range(len(ColumnNames)):
		for k in range(38):
			if(ColumnNames[j] in lines[0][k]):
				ColumnPositions.append(k)

	AfterThen = len(ColumnNames) - BeforeThen

	E1 = 0
	Y1 = 0
	Y2 = [0] * (len(ColumnPositions) - AfterThen)
	E2 = [0] * (len(ColumnPositions) - AfterThen)

	for Turn in range(-1, len(ColumnPositions) - AfterThen):
		for r in range(1, maxRows):
			for c in range(len(ColumnPositions)):
				NoNegating = True
				if(c == Turn):
					NoNegating = False
				StatementAcc = False
				if(Sign[c] == ">="):
					if(NoNegating):
						if(lines[r][ColumnPositions[c]] >= Number[c]):
							StatementAcc = True
					else:
						if(lines[r][ColumnPositions[c]] < Number[c]):
							StatementAcc = True
				elif(Sign[c] == ">"):
					if(NoNegating):
						if(lines[r][ColumnPositions[c]] > Number[c]):
							StatementAcc = True
					else:
						if(lines[r][ColumnPositions[c]] <= Number[c]):
							StatementAcc = True
				elif(Sign[c] == "<="):
					if(NoNegating):
						if(lines[r][ColumnPositions[c]] <= Number[c]):
							StatementAcc = True
					else:
						if(lines[r][ColumnPositions[c]] > Number[c]):
							StatementAcc = True
				elif(Sign[c] == "<"):
					if(NoNegating):
						if(lines[r][ColumnPositions[c]] < Number[c]):
							StatementAcc = True
					else:
						if(lines[r][ColumnPositions[c]] >= Number[c]):
							StatementAcc = True
				elif(Sign[c] == "="):
					if(NoNegating):
						if(lines[r][ColumnPositions[c]] == Number[c]):
							StatementAcc = True
					else:
						if(lines[r][ColumnPositions[c]] != Number[c]):
							StatementAcc = True
				else:
					print("Somethings not right")
				#before then and statement is false then just stop
				if(not(c >= len(ColumnPositions) - AfterThen) and not(StatementAcc)):
					break
				#After then, meaning all statements before then were true so start 
				#counting Y1 and E1 as well as Y2 and E2
				if((c >= len(ColumnPositions) - AfterThen)):
					#Checks if a condition after then is correct, if not then E's go up and breaks
					if(StatementAcc):
						if(c == len(ColumnPositions) - 1):
							if(Turn == -1):
								Y1 += 1
							else:
								Y2[Turn] += 1
					else:
						if(Turn == -1):
							E1 += 1
						else:
							E2[Turn] += 1
						break
	Y2.insert(0, Y1)
	E2.insert(0, E1)
	YE_Table = []
	YE_Table.append(Y2)
	YE_Table.append(E2)
	return YE_Table



print(YandE_Generator("If FIT101 = LT4.385068655 then P401 = 2"))
count = 0
f1 = open('CleanRules.txt','r')
f2 = open('Y_E_Tables.txt', 'w')
AllRules = f1.readlines()
for Rule in AllRules:
	count = count + 1
	print(count)
	f2.write(str(YandE_Generator(Rule)) + "\n")

f1.close()
f2.close()

