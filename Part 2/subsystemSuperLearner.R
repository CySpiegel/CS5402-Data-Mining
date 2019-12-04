library(SuperLearner)
library(KernelKnn)
library(kernlab)
library(dplyr)
library(caret)
library(e1071)
library(bnlearn)
library(arules)
library(arm)
library(xgboost)


subSystemP1 = hw8_data[, c("is_attack","P101","MV101","FIT101","LIT101")]
subSystemP2 = hw8_data[, c("is_attack","P203","P205","MV201","AIT201","AIT202","AIT203","FIT201")]
subSystemP3 = hw8_data[, c("is_attack","P301","MV301","MV302","MV304","MV303","DPIT301","FIT301","LIT301")]
subSystemP4 = hw8_data[, c("is_attack","P401","UV401","AIT402","FIT401","LIT401")]
subSystemP5 = hw8_data[, c("is_attack","AIT501","AIT502","AIT503","AIT504","FIT501","FIT502","FIT503","FIT504","PIT501","PIT502","PIT503")]
subSystemP6 = hw8_data[, c("is_attack","P601","FIT601")]


SL.kernelKnnManhattan = function(...) {
  SL.kernelKnn(..., method = "manhattan", k=5)
}

algorithmList = list("SL.mean","SL.ranger","SL.ksvm","SL.kernelKnnManhattan","SL.bayesglm","SL.xgboost")


options(mc.cores = 7)
getOption("mc.cores")
set.seed(1, "L'Ecuyer-CMRG")

# SubSystemP1 Training and test sets.
trainingSetSubSysP1 = sample(seq_len(nrow(subSystemP1)), size = floor(0.66*nrow(subSystemP1)))
xTrainSubSusP1 = subSystemP1[trainingSetSubSysP1,2:5]
yTrainSubSysP1 = as.numeric(subSystemP1[trainingSetSubSysP1, 1])

xTestSubSysP1 = subSystemP1[-trainingSetSubSysP1,2:5]
yTestSubSysP1 = as.numeric(subSystemP1[-trainingSetSubSysP1, 1])

# SubSystemP2 Training and test sets.
trainingSetSubSysP2 = sample(seq_len(nrow(subSystemP2)), size = floor(0.66*nrow(subSystemP2)))
xTrainSubSusP2 = subSystemP2[trainingSetSubSysP2,2:8]
yTrainSubSysP2 = as.numeric(subSystemP2[trainingSetSubSysP2, 1])

xTestSubSysP2 = subSystemP2[-trainingSetSubSysP2,2:8]
yTestSubSysP2 = as.numeric(subSystemP2[-trainingSetSubSysP2, 1])

# SubSystemP3 Training and test sets.
trainingSetSubSysP3 = sample(seq_len(nrow(subSystemP3)), size = floor(0.66*nrow(subSystemP3)))
xTrainSubSusP3 = subSystemP3[trainingSetSubSysP3,2:9]
yTrainSubSysP3 = as.numeric(subSystemP3[trainingSetSubSysP3, 1])

xTestSubSysP3 = subSystemP3[-trainingSetSubSysP3,2:9]
yTestSubSysP3 = as.numeric(subSystemP3[-trainingSetSubSysP3, 1])


# SubSystemP4 Training and test sets.
trainingSetSubSysP4 = sample(seq_len(nrow(subSystemP4)), size = floor(0.66*nrow(subSystemP4)))
xTrainSubSusP4 = subSystemP4[trainingSetSubSysP4,2:6]
yTrainSubSysP4 = as.numeric(subSystemP4[trainingSetSubSysP4, 1])

xTestSubSysP4 = subSystemP4[-trainingSetSubSysP4,2:6]
yTestSubSysP4 = as.numeric(subSystemP4[-trainingSetSubSysP4, 1])

# SubSystemP5 Training and test sets.
trainingSetSubSysP5 = sample(seq_len(nrow(subSystemP5)), size = floor(0.66*nrow(subSystemP5)))
xTrainSubSusP5 = subSystemP5[trainingSetSubSysP5,2:12]
yTrainSubSysP5 = as.numeric(subSystemP5[trainingSetSubSysP5, 1])

xTestSubSysP5 = subSystemP5[-trainingSetSubSysP5,2:12]
yTestSubSysP5 = as.numeric(subSystemP5[-trainingSetSubSysP5, 1])


# SubSystemP6 Training and test sets.
trainingSetSubSysP6 = sample(seq_len(nrow(subSystemP6)), size = floor(0.66*nrow(subSystemP6)))
xTrainSubSusP6 = subSystemP6[trainingSetSubSysP6,2:3]
yTrainSubSysP6 = as.numeric(subSystemP6[trainingSetSubSysP6, 1])

xTestSubSysP6 = subSystemP6[-trainingSetSubSysP6,2:3]
yTestSubSysP6 = as.numeric(subSystemP6[-trainingSetSubSysP6, 1])



#system.time({
 # CFVSubSysP1 = CV.SuperLearner(yTrainSubSysP1, xTrainSubSusP1, V = 3, parallel = "multicore", family = binomial(), SL.library = algorithmList)
#})

# SubsystemP1 modeling
modelSubSysP1 = SuperLearner(Y = yTrainSubSysP1, X = xTrainSubSusP1, family = binomial(), SL.library = algorithmList)
predictionSubSysP1 = predict.SuperLearner(modelSubSysP1, newdata = xTestSubSysP1)
predictedResultSubSysP1 = as.numeric(ifelse(predictionSubSysP1$pred>=0.5,1,0))
confMatrixSubSysP1 = confusionMatrix(as.factor(yTestSubSysP1), as.factor(predictedResultSubSysP1))


# SybSystemP2 modeling
modelSubSysP2 = SuperLearner(Y = yTrainSubSysP2, X = xTrainSubSusP2, family = binomial(), SL.library = algorithmList)
predictionSubSysP2 = predict.SuperLearner(modelSubSysP2, newdata = xTestSubSysP2)
predictedResultSubSysP2 = as.numeric(ifelse(predictionSubSysP2$pred>=0.5,1,0))
confMatrixSubSysP2 = confusionMatrix(as.factor(yTestSubSysP2), as.factor(predictedResultSubSysP2))


# SybSystemP3 modeling
modelSubSysP3 = SuperLearner(Y = yTrainSubSysP3, X = xTrainSubSusP3, family = binomial(), SL.library = algorithmList)
predictionSubSysP3 = predict.SuperLearner(modelSubSysP3, newdata = xTestSubSysP3)
predictedResultSubSysP3 = as.numeric(ifelse(predictionSubSysP3$pred>=0.5,1,0))
confMatrixSubSysP3 = confusionMatrix(as.factor(yTestSubSysP3), as.factor(predictedResultSubSysP3))

# SybSystemP4 modeling
modelSubSysP4 = SuperLearner(Y = yTrainSubSysP4, X = xTrainSubSusP4, family = binomial(), SL.library = algorithmList)
predictionSubSysP4 = predict.SuperLearner(modelSubSysP4, newdata = xTestSubSysP4)
predictedResultSubSysP4 = as.numeric(ifelse(predictionSubSysP4$pred>=0.5,1,0))
confMatrixSubSysP4 = confusionMatrix(as.factor(yTestSubSysP4), as.factor(predictedResultSubSysP4))

# SybSystemP5 modeling
modelSubSysP5 = SuperLearner(Y = yTrainSubSysP5, X = xTrainSubSusP5, family = binomial(), SL.library = algorithmList)
predictionSubSysP5 = predict.SuperLearner(modelSubSysP5, newdata = xTestSubSysP5)
predictedResultSubSysP5 = as.numeric(ifelse(predictionSubSysP5$pred>=0.5,1,0))
confMatrixSubSysP5 = confusionMatrix(as.factor(yTestSubSysP5), as.factor(predictedResultSubSysP5))


# SubsystemP6 modeling
modelSubSysP6 = SuperLearner(Y = yTrainSubSysP6, X = xTrainSubSusP6, family = binomial(), SL.library = algorithmList)
predictionSubSysP1 = predict.SuperLearner(modelSubSysP6, newdata = xTestSubSysP6)
predictedResultSubSysP6 = as.numeric(ifelse(predictionSubSysP6$pred>=0.5,1,0))
confMatrixSubSysP6 = confusionMatrix(as.factor(yTestSubSysP6), as.factor(predictedResultSubSysP6))



# SubSystemP1 CrossFold Validation for calculating Area Under Curve
system.time({
  cv_slSubSysP1 = CV.SuperLearner(Y = yTrainSubSysP1, X = xTrainSubSusP1, family = binomial(),
                          # For a real analysis we would use V = 10.
                          V = 10,
                          parallel = "multicore",
                          method = "method.AUC",
                          SL.library = algorithmList)
})


# SubSystemP2 CrossFold Validation for calculating Area Under Curve
system.time({
  cv_slSubSysP2 = CV.SuperLearner(Y = yTrainSubSysP2, X = xTrainSubSusP2, family = binomial(),
                                  # For a real analysis we would use V = 10.
                                  V = 10,
                                  parallel = "multicore",
                                  method = "method.AUC",
                                  SL.library = algorithmList)
})

# SubSystemP3 CrossFold Validation for calculating Area Under Curve
system.time({
  cv_slSubSysP3 = CV.SuperLearner(Y = yTrainSubSysP3, X = xTrainSubSusP3, family = binomial(),
                                  # For a real analysis we would use V = 10.
                                  V = 10,
                                  parallel = "multicore",
                                  method = "method.AUC",
                                  SL.library = algorithmList)
})

# SubSystemP4 CrossFold Validation for calculating Area Under Curve
system.time({
  cv_slSubSysP4 = CV.SuperLearner(Y = yTrainSubSysP4, X = xTrainSubSusP4, family = binomial(),
                                  # For a real analysis we would use V = 10.
                                  V = 10,
                                  parallel = "multicore",
                                  method = "method.AUC",
                                  SL.library = algorithmList)
})


# SubSystemP1 CrossFold Validation for calculating Area Under Curve
system.time({
  cv_slSubSysP4 = CV.SuperLearner(Y = yTrainSubSysP4, X = xTrainSubSusP4, family = binomial(),
                                  # For a real analysis we would use V = 10.
                                  V = 10,
                                  parallel = "multicore",
                                  method = "method.AUC",
                                  SL.library = algorithmList)
})


# SubSystemP1 CrossFold Validation for calculating Area Under Curve
system.time({
  cv_slSubSysP5 = CV.SuperLearner(Y = yTrainSubSysP5, X = xTrainSubSusP5, family = binomial(),
                                  # For a real analysis we would use V = 10.
                                  V = 10,
                                  parallel = "multicore",
                                  method = "method.AUC",
                                  SL.library = algorithmList)
})

# SubSystemP1 CrossFold Validation for calculating Area Under Curve
system.time({
  cv_slSubSysP6 = CV.SuperLearner(Y = yTrainSubSysP6, X = xTrainSubSusP6, family = binomial(),
                                  # For a real analysis we would use V = 10.
                                  V = 10,
                                  parallel = "multicore",
                                  method = "method.AUC",
                                  SL.library = algorithmList)
})




