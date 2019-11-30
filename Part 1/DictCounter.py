import os
import glob
from collections import OrderedDict
import csv
ValuesDictionary = {} 

fields = []
rows = []
csvLocation = ("originalDataset.csv")
with open(csvLocation, mode='r') as csvfile:
	csvreader = csv.reader(csvfile)
	fields = next(csvreader)
	for row in csvreader:
			rows.append(row)
Correct = True
for i in range(30,31):
	values = []
	valueCounts = []

	print(fields[i+1])
	for j in range(14996):
		ValuesDictionary[rows[j][i+1]] = ValuesDictionary.get( rows[j][i+1], 0) + 1

ValuesDictionarySorted = OrderedDict(sorted(ValuesDictionary.items(), key=lambda x: x[1], reverse=True))



for k, v in ValuesDictionarySorted.items():
    print("Value: ",k, "\t Appears: ", v)
print(Correct)


