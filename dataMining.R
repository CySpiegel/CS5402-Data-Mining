
#Normalize data from LIT100 by time100 if data less than 100 and divde 100 if greater 999

changeDecimaFIT301<-function(x){
  for(i in 1 : NROW(x)){
    ifelse(x[i] > 100 ,x[i]<-x[i]/100,"TRIE")  
  }
  #  x<-ifelse(x>100,x/100,
  #                  (ifelse(x>999,x/100,x)))
  return(x);
}

changeDecimaAIT402<-function(x){
  for(i in 1 : NROW(x)){
    ifelse(x[i]<=1&x[i]>=0.0999999,x[i]<-x[i]*100,
           ifelse(x[i]<0.0999999,x[i]<-x[i]*1000,
                  ifelse(x[i]>100,x[i]<-x[i]/100,x[i])))  
  }
  for(i in 1:NROW(x)){
    ifelse(x[i]<100 & abs(x[i]-x[i-1])>20,x[i]<-x[i]/10,x[i])
  }
  return(x);
}


average<-function(x){
  for( i in 1:length(x)){
    counter<-NULL
    if(is.na(x[i]) & !is.na((x[i+1]))){
      x[i]<-(x[i-1]+x[i+1])/2
    }else{
      if(is.na(x[i]) & is.na((x[i+1]))){
        counter<-i
        while(is.na(x[counter])){
          counter<-counter+1
        }
        x[i]<-(x[i-1]+x[i+counter])/2       
      }
      x[i]<-x[i]
    }
  }  
  return(x)
}

createRange<-function (x){
  rangeColumn=c(0,0)
  x<-sort(x)
  dividedValue<-ceiling(NROW(x)/3)
  rangeColumn[1]<-x[dividedValue]
  rangeColumn[2]<-x[dividedValue+dividedValue]
  return(rangeColumn)
}


createRangeNominal<-function(dataset){
  rangeColumn=c(0,0)
  tempdataset<-sort(dataset)
  dividedValue<-ceiling(NROW(tempdataset)/3)
  rangeColumn[1]<-tempdataset[dividedValue]
  rangeColumn[2]<-x[dividedValue+dividedValue]
  dataset<-ifelse(dataset<=range[1],"LOW",
                  ifelse(dataset>range[1]&dataset<=range[2],"MEDIUM","HIGH")) 
  return(dataset)
}

sortByRange<-function(x){
  uniqueList<-unique(x)
  dict<-c(0,0)
  for(i in 1: NROW(uniqueList)){
    dict[i]<-uniqueList[i]
    dict[i]<-NROW(x[x==dict[1]])
  }
  return(dict)
}
