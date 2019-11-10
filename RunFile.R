originalDataset <- read.csv("C:/Users/chimi/OneDrive/Homework/MST/CS5402/theDataMiningProject/originalDataset.csv")
View(originalDataset)

data$is_attack = YNReplace(data$is_attack)

# cluster min max

dataStripped <- LeoAverageNAReplace(data$LIT101)
dataKMeans <- kmeans(dataStripped, 3)
clusterGroups <- cbind(dataStripped, clusterNum = dataKMeans$cluster)

cluster1 = clusterGroups[clusterGroups[, "clusterNum"] == 1,]
cluster2 = clusterGroups[clusterGroups[, "clusterNum"] == 2,]
cluster3 = clusterGroups[clusterGroups[, "clusterNum"] == 3,]

View()