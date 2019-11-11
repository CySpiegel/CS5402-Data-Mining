import csv
fields = []
rows = []
csvLocation = ("5402_dataset - Copy.csv")

r = csv.reader(open(csvLocation))
lines = list(r)

maxRows = 14996 - 1
#All the MV columns
TMVColumns = [21,22,23,25,26,27]

value = 0

for i in TMVColumns:
	value = 0
	for j in range(maxRows):
		value = lines[j][i]
		if value == "NA" and j > 1:
			lines[j][i] = lines[j-1][i]
		if value == "NA" and j > 0:
			lines[j][i] = lines[j+1][i]

writer = csv.writer(open(csvLocation, 'w', newline = ''))
writer.writerows(lines)



