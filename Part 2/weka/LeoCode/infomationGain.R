
convertToNominal <- function(numericCol){
  if(length(unique(numericCol)) ==2){
    nominalCol<-ifelse(numericCol==0,'no','yes') 
    numericCol<-nominalCol
    return(numericCol)
  }
  
}
createRangeNominal<-function(dataset,partitionValue){
  #only change data value to nominal when the variance has big value which It
  # is continous data
  dataset<-ifelse(dataset<partitionValue[1],paste("LT",toString(partitionValue),sep=""),
                    paste("GT",toString(partitionValue),sep = ""))
  
  
  return(dataset)
}



#Delete last and first value since there entropy is 0
#averageList<-averageList[2:(length(averageList)-1)]

InfoGain <- function(decisionAttribute,continousAttribute){
  decisionAttribute<-convertToNominal(decisionAttribute)
  unique(decisionAttribute)
  #Finding unique values
  distint_value<-unique(continousAttribute)
  #Get the list of partitions
  averageList <-vector(mode="list",length = length(distint_value))
  for(i in 1 : length(distint_value)-1) {
    averageList[i]<-((distint_value[i]+distint_value[i+1])/2)
    
  }
  #Delete null value in list
  averageList<-Filter(Negate(is.null),averageList)
  
    " Build the entropy function"
    
  maxValue<-c()  # value holds the best partition
  informationGain<-c() # list of best parttion
    for(j in 1: (length(averageList))){
      LT<-c()
      GT<-c()

      for( i in 1 : (length(decisionAttribute))){
        if(continousAttribute[[i]]<= averageList[[j]]){
          if( decisionAttribute[[i]]=='yes'){
            LT[length(LT)+1]<-'yes'
          }else{
            LT[length(LT)+1]<-'no'
          }
        }else{
          if( decisionAttribute[[i]]=='yes'){
            GT[length(GT)+1]<-'yes'
          }else{
            GT[length(GT)+1]<-'no'
          }
        }
      }
      
      entropyLT<-(-sum( (table(LT)/length(LT))* log2((table(LT)/length(LT))) ))
      entropyGT<-(-sum( (table(GT)/length(GT))* log2((table(GT)/length(GT))) ))
      entropyBefore<-(-sum( (table(decisionAttribute)/length(decisionAttribute)) * 
                              log2((table(decisionAttribute)/length(decisionAttribute))) ))
      #calculate Entropy after Split
      totalInstance<-length(LT)+length(GT)
      entropyAfterSplit<-(length(LT)/totalInstance * entropyLT) + 
                              (length(GT)/totalInstance * entropyGT)
     
        informationGain[length(informationGain)+1] <- 
          (entropyBefore - entropyAfterSplit)
       
    }
  #infoGainList$X2<-informationGain
  #print(infoGainList)
  "Delete last and first value since of the average list since the entropies are 0"
  averageList<-averageList[2:(length(averageList)-1)]
  informationGain<-informationGain[2:(length(informationGain)-1)]
  "for(k in 1:length(informationGain)){
    print(averageList[[k]])
    print(informationGain[[k]])
  }"
  infoGainList<-data.frame(matrix(ncol = 2,nrow = length(averageList)))
  infoGainList$X1<-averageList
  infoGainList$X2<-informationGain
  
  #add max value to first index of maxValue list
  #maxValue[length(maxValue)+1]<-max(infoGainList$X2)
  for(i in 1:length(infoGainList$X2)){
    if(infoGainList$X2[i]==max(infoGainList$X2)){
      
      #append the partition value to maxValue list
      maxValue[length(maxValue)+1]<-infoGainList$X1[[i]]
    }
   
  }
  #print(length(maxValue))
  #print(maxValue)
  return(maxValue)
}

