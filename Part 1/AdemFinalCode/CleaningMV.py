import csv
fields = []
rows = []
csvLocation = ("FinalDataset - Copy.csv")

r = csv.reader(open(csvLocation))
lines = list(r)

maxRows = 14996 - 1
#All the MV columns
TMVColumns = [8,9,10,12,13,14]

value = 0

for i in TMVColumns:
	value = 0
	for j in range(maxRows):
		value = lines[j][i]
		if value == "NA" and j > 1:
			lines[j][i] = lines[j-1][i]
		elif value == "NA" and j > 0:
			lines[j][i] = lines[j+1][i]

writer = csv.writer(open(csvLocation, 'w', newline = ''))
writer.writerows(lines)



