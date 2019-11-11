import csv
fields = []
rows = []
csvLocation = ("originalDataset.csv")
with open(csvLocation, mode='r') as csvfile:
	csvreader = csv.reader(csvfile)
	fields = next(csvreader)
	for row in csvreader:
			rows.append(row)
Correct = True
for i in range(24):
	values = []
	valueCounts = []
	print(fields[i+1])
	for j in range(14996):
		if rows[j][i+1] not in values:
			values.append(rows[j][i+1])
			valueCounts.append(1)
		else:
			Index = values.index(rows[j][i+1])
			valueCounts[Index] += 1
	print(values)
	print(valueCounts)
	Total = 0
	for k in range(len(valueCounts)):
		Total = Total + valueCounts[k]
	print(Total)
	if(Total != 14996):
		Correct = False
print(Correct)


