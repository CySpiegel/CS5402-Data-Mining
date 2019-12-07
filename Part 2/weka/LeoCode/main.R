################# MAIN FUNCTION #####################################


## Linear regression of the numeric dataset
fit<-lm(y$is_attack~y$P101+
          y$P203+
          y$P205+
          y$P301+
          y$P401+ 
          y$P601+
          y$MV301+
          y$MV302+
          y$MV304+
          y$UV401+
          y$MV101+
          y$MV201+
          y$MV303+
          y$AIT202+
          y$AIT203+
          y$FIT201+y$DPIT301+y$FIT301+y$LIT301+y$AIT402+y$FIT401+
          y$LIT401+
          y$AIT501+
          y$AIT502+
          y$AIT503+
          y$AIT504+
          y$FIT501+
          y$FIT502+
          y$FIT503+
          y$FIT504+
          y$PIT501+
          y$PIT502+
          y$PIT503+
          y$FIT601+
          y$AIT201)
plot(fit)

main<-function(){
  hw8<-read.csv(file="~/CS5402/HW8/hw8_data.csv")
  columnsName<-colnames(hw8)
  #16 which column start from FIT101
  for(i in 15:NROW(columnsName)){
    print(columnsName[i])
    #hw8[c(columnsName[i])]
    "Sort the datase based on the values of ith column
    NOTE: this step must be done before calculte the infomation Gain"
    hw8<-hw8[order(hw8[c(columnsName[[i]])]),]
    "Call infoGain funtion for calculate the information gain"
    partitionValue<-InfoGain(hw8$is_attack,hw8[[c(columnsName[i])]])
    hw8[c(columnsName[[i]])]<-createRangeNominal(hw8[c(columnsName[[i]])],partitionValue)
    
  }
  write.csv(hw8,file="~/CS5402/HW8/testFit1.csv")
}