subSystemP1 = hw8_data[, c("is_attack","P101","MV101","FIT101","LIT101")]
subSystemP2 = hw8_data[, c("is_attack","P203","P205","MV201","AIT201","AIT202","AIT203","FIT201")]
subSystemP3 = hw8_data[, c("is_attack","P301","MV301","MV302","MV304","MV303","DPIT301","FIT301","LIT301")]
subSystemP4 = hw8_data[, c("is_attack","P401","UV401","AIT402","FIT401","LIT401")]
subSystemP5 = hw8_data[, c("is_attack","AIT501","AIT502","AIT503","AIT504","FIT501","FIT502","FIT503","FIT504","PIT501","PIT502","PIT503")]
subSystemP6 = hw8_data[, c("is_attack","P601","FIT601")]

options(mc.cores = 4)
getOption("mc.cores")
set.seed(1, "L'Ecuyer-CMRG")

# SubSystemP1 Training and test sets.
trainingSetSubSysP1 = sample(seq_len(nrow(subSystemP1)), size = floor(0.66*nrow(subSystemP1)))
xTrainSubSusP1 = subSystemP1[trainingSetSubSysP1,2:5]
yTrainSubSysP1 = as.numeric(subSystemP1[trainingSetSubSysP1, 1])

xTestSubSysP1 = subSystemP1[-trainingSetSubSysP1,2:5]
yTestSubSysP2 = as.numeric(subSystemP1[-trainingSetSubSysP1, 1])