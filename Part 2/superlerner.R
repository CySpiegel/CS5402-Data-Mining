library(SuperLearner)
library(KernelKnn)
library(kernlab)
library(dplyr)
library(caret)
library(e1071)
library(bnlearn)
library(arules)
library(arm)
library(parallel)
library(xgboost)
library(ranger)

# listWrappers()
#load data into frame
data = hw8_data

options(mc.cores = 4)
getOption("mc.cores")
set.seed(1, "L'Ecuyer-CMRG")

# Reduce to a dataset random observations.
trainingSet = sample(seq_len(nrow(data)), size = floor(0.66*nrow(data)))
xTrain = data[trainingSet,2:38]
xTest = data[-trainingSet,2:38]

yTrain = as.numeric(data[trainingSet, 1])
yTest = as.numeric(data[-trainingSet, 1])

SL.kernelKnnManhattan = function(...) {
  SL.kernelKnn(..., method = "manhattan", k=5)
}


algorithmList = list("SL.mean","SL.ranger","SL.ksvm","SL.kernelKnnManhattan","SL.bayesglm","SL.xgboost")

# Risk assessment
system.time({
crossFoldValidation = CV.SuperLearner(yTrain, xTrain, V = 10, parallel = "multicore", family = binomial(), SL.library = algorithmList)
})

#Building the model
model = SuperLearner(Y = yTrain, X = xTrain, family = binomial(), SL.library = algorithmList)
prediction = predict.SuperLearner(model, newdata = xTest)
predictedResult = as.numeric(ifelse(prediction$pred>=0.5,1,0))
confMatrix = confusionMatrix(as.factor(yTest), as.factor(predictedResult))


# Calculating area under the curve using 10 fold cross validation
system.time({
cv_sl = CV.SuperLearner(Y = yTrain, X = xTrain, family = binomial(),
                        V = 10,
                        parallel = "multicore",
                        method = "method.AUC",
                        SL.library = algorithmList)
})

confMatrix
summary(cv_sl)
