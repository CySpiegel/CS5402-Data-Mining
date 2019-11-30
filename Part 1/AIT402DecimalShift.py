import csv
import statistics
fields = []
rows = []
csvLocation = ("5402_dataset - Copy.csv")

r = csv.reader(open(csvLocation))
lines = list(r)

x = 1

maxRows = 14996
#The FIT101 column    AIT402
LIT101Column = [37]
for i in LIT101Column:
	for j in range(maxRows):
		prevValue = 0
		value = 0
		if j > 1:
			while(prevValue == 0):
				if lines[j-x][i] != "NA":
					prevValue = lines[j-x][i]
				else:
					x = x + 1
		x = 1
		value = lines[j][i]
		if(value != "NA" and j > 1):
			value = float(value)
			prevValue = float(prevValue)
			while(value < (prevValue * 0.9) or value > (prevValue * 1.10)):
				if(value < (prevValue * 1.10)):
					value = value * 10
				if(value > (prevValue * 1.10)):
					value = value / 10
				lines[j][i] = str(value)

writer = csv.writer(open(csvLocation, 'w', newline = ''))
writer.writerows(lines)