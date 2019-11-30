import csv
fields = []
rows = []
csvLocation = ("FinalDataset - Copy.csv")

r = csv.reader(open(csvLocation))
lines = list(r)

maxRows = 14996 - 1
#The FIT101 column
FIT101Column = [15]

value = 0
prevValue = 0
nextValue = 0
Average = 0

for i in FIT101Column:
	value = 0
	for j in range(maxRows):
		if j > 1:	
			value = lines[j][i]
			prevValue = lines[j-1][i]
			nextValue = lines[j+1][i]
			if nextValue == "NA":
				nextValue = lines[j+2][i]
			Average = 0
			if value == "NA":
				Average = (float(prevValue) + float(nextValue))/2
				lines[j][i] = str('{0:g}'.format(Average))
				
writer = csv.writer(open(csvLocation, 'w', newline = ''))
writer.writerows(lines)
