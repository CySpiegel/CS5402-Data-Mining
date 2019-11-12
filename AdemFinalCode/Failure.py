import csv
fields = []
rows = []
csvLocation = ("5402_dataset - Copy.csv")

r = csv.reader(open(csvLocation))
lines = list(r)

maxRows = 14996
#All the MV columns
TMVColumns = [21,22,23,25,26,27]

value = 0
previousValue = 0

for i in TMVColumns:
	value = 0
	previousValue = 0
	for j in range(maxRows):
		value = lines[j][i]
		if j > 1:
			previousValue = lines[j-1][i]
		if value == "CLOSED":
			if previousValue != 0:
				if previousValue != value and previousValue != "ALMOST_CLOSED":
					lines[j][i] = previousValue
					print(previousValue)
					print("Made a CLOSED change at:" + str(i) + " " + str(j))

		elif value == "SEMI_CLOSED":
			if previousValue != 0:
				if previousValue != value and previousValue != "OPEN":
					lines[j][i] = previousValue
					print(previousValue)
					print("Made a SEMI_CLOSED change at:" + str(i) + " " + str(j))

		elif value == "ALMOST_CLOSED":
			if previousValue != 0:
				if previousValue != value and previousValue != "SEMI_CLOSED":
					lines[j][i] = previousValue
					print(previousValue)
					print("Made a ALMOST_CLOSED change at:" + str(i) + " " + str(j))

		elif value == "OPEN":
			if previousValue != 0:
				if previousValue != value and previousValue != "ALMOST_OPEN":
					lines[j][i] = previousValue
					print(previousValue)
					print("Made a OPEN change at:" + str(i) + " " + str(j))

		elif value == "SEMI_OPEN":
			if previousValue != 0:
				if previousValue != value and previousValue != "CLOSED":
					lines[j][i] = previousValue
					print(previousValue)
					print("Made a SEMI_OPEN change at:" + str(i) + " " + str(j))

		elif value == "ALMOST_OPEN":
			if previousValue != 0:
				if previousValue != value and previousValue != "SEMI_OPEN":
					lines[j][i] = previousValue
					print(previousValue)
					print("Made a ALMOST_OPEN change at:" + str(i) + " " + str(j))

		elif value == "NA":
			if j > 0:	
				lines[j][i] = previousValue
			else:
				lines[j][i] = lines[j+1][i]
		else:
			print("Error: No match found")
			print(value)
			if previousValue != 0:
				lines[j][i] = previousValue

	