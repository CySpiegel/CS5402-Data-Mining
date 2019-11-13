import csv
fields = []
rows = []
csvLocation = ("FinalDataset.csv")

r = csv.reader(open(csvLocation))
lines = list(r)

maxRows = 14996 - 1
#All the MV columns
TMVColumns = [8,9,10,12,13,14]

value = 0
NextValue = 0
count = 0

for i in TMVColumns:
	value = 0
	NextValue = 0
	for j in range(maxRows):
		value = lines[j][i]
		NextValue = lines[j+1][i]
		if value == "NA" and j == 1:
			lines[j][i] = NextValue
		if value == "NA" and j > 1:
			lines[j][i] = lines[j-1][i]
		value = lines[j][i]
		NextValue = lines[j+1][i]
		if value == "SEMI_CLOSED":
			if NextValue != value and NextValue != "ALMOST_CLOSED" and NextValue != "NA":
				print("Problem at: " + str(i) + " " + str(j))
				count += 1
		elif value == "ALMOST_CLOSED":
			if NextValue != value and NextValue != "CLOSED" and NextValue != "NA":
				print("Problem at: " + str(i) + " " + str(j))
				count += 1
		elif value == "CLOSED":
			if NextValue != value and NextValue != "SEMI_OPEN" and NextValue != "NA":
				print("Problem at: " + str(i) + " " + str(j))
				count += 1
		elif value == "SEMI_OPEN":
			if NextValue != value and NextValue != "ALMOST_OPEN" and NextValue != "NA":
				print("Problem at: " + str(i) + " " + str(j))
				count += 1
		elif value == "ALMOST_OPEN":
			if NextValue != value and NextValue != "OPEN" and NextValue != "NA":
				print("Problem at: " + str(i) + " " + str(j))
				count += 1
		elif value == "OPEN":
			if NextValue != value and NextValue != "SEMI_CLOSED" and NextValue != "NA":
				print("Problem at: " + str(i) + " " + str(j))
				count += 1
		else:
			if(j > 0):
				print("Unknown Value: " + str(value) + " at: " + str(i) + " " + str(j))
