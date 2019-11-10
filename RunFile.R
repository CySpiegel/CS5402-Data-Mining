originalDataset <- read.csv("C:/Users/chimi/OneDrive/Homework/MST/CS5402/theDataMiningProject/originalDataset.csv")
View(originalDataset)

data$is_attack = YNReplace(data$is_attack)

# cluster min max



clusterGroups <- cbind(data$LIT101, clusterNum = testKMeans$cluster)
cluster1 = clusterGroups[clusterGroups[, "clusterNum"] == 1,]
luster2 = clusterGroups[clusterGroups[, "clusterNum"] == 2,]
cluster3 = clusterGroups[clusterGroups[, "clusterNum"] == 3,]