import csv
fields = []
rows = []
csvLocation = ("FinalDataset - Copy.csv")

r = csv.reader(open(csvLocation))
lines = list(r)

maxRows = 14996
#CleaningPumps and UV401
TPumpColumns = [2,3,4,5,6,7,11]
Average = 0
ReplaceValue = 0

for i in TPumpColumns:
	for j in range(maxRows):
		value = lines[j][i]
		if value == "NA":
			lines[j][i] = "1.5"

for i in TPumpColumns:
	for j in range(maxRows):
		value = lines[j][i]
		if(value == "1.5" and (j > 1) and (j < (maxRows - 1))):
			Average = (float(lines[j-2][i]) + float(lines[j-1][i]) + float(lines[j+1][i]) + float(lines[j+2][i]))/4
			if(Average < 1.5):
				ReplaceValue = "1"
			else:
				ReplaceValue = "2"
			lines[j][i] = ReplaceValue


writer = csv.writer(open(csvLocation, 'w', newline = ''))
writer.writerows(lines)