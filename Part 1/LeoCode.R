y<-read.csv(file="~/CS5402/5402_datasetEdit5.csv")


#Replace NA values 
average<-function(x){
  #check if the first data is na or not
  if(is.na(x[1])){
    x[1]<-x[2]
  }
  for( i in 1:length(x)){
    counter<-NULL
    if(is.na(x[i]) & !is.na((x[i+1]))){
      x[i]<-(x[i-1]+x[i+1])/2
    }else{
      if(is.na(x[i]) & is.na((x[i+1]))){
        #if NA values is the end of data set
        if(i==NROW(x)){
          x[i]<-x[i-1]
        }else{
          counter<-i
          while(is.na(x[counter])){
            counter<-counter+1
          }
          x[i]<-(x[i-1]+x[counter])/2             
        }
    
      }
      x[i]<-x[i]
    }
  }  
  return(x)
}

#Shifting decimal points to correct position
cleaningColumns<-function(x){
  minRange<-0
  maxRange<-0
  counter<-1 
  if(is.na(x[1])){
    while(is.na(x[counter])){
      counter<- counter +1
    }
    
    minRange<-x[counter]*0.5
    maxRange<-x[counter]*1.5
    
    counter<-1 
  }else{
    minRange<-x[1]*0.5
    maxRange<-x[1]*1.5
  }

  for(i in 2 : NROW(x)){
    if(!is.na(x[i])){
      prev<-0
      if(is.na(x[i-1])){
        counter<-(i-1)
        while(is.na(x[counter])){
          ifelse(counter==1,counter<-counter+1,counter<-counter-1)
        }
        prev<-x[counter]
      }else{
        prev<-x[i-1]
      }
      if((x[i] < minRange | x[i] > maxRange) )
      {
        if(x[i] > prev ){
          x[i]<-as.double(x[i]/100)
        }else{
          if(x[i] < prev )
            x[i]<-as.double(x[i]*as.double(100))
        }
      }else {
        x[i]<-x[i]
      }
      minRange<-x[i]*0.9
      maxRange<-x[i]*1.1
    }

  }
  return(x);
}

createRangeNominal<-function(dataset){
  #only change data value to nominal when the variance has big value which It
  # is continous data
    rangeColumn=c(0,0)
    tempdataset<-sort(dataset)
    dividedValue<-ceiling(NROW(tempdataset)/3)
    rangeColumn[1]<-tempdataset[dividedValue]
    rangeColumn[2]<-tempdataset[dividedValue+dividedValue]
    dataset<-ifelse(dataset<=rangeColumn[1],paste("LT",toString(rangeColumn[1])),
                    ifelse(dataset>rangeColumn[1]&dataset<=rangeColumn[2],paste("GT",toString(rangeColumn[1]),"&LT",toString(rangeColumn[2])),paste("GT",toString(rangeColumn[2])))) 
    
  return(dataset)
}

columnsName<-colnames(y)
final<-y
#16 which column start from LIT101
for(i in 17:NROW(columnsName)){
    print(columnsName[i])
    final[i]<-cleaningColumns(final[[i]])
    final[i]<-average(final[[i]])
    print(var(final[[i]]))
    if(var(final[[i]]) >1){
      final[i]<-createRangeNominal(final[[i]])
    }
}
View(final)
'Delete Columns because variance of these collumn were close to 0 which their data are the same to 
entire of datase:
[1] "AIT202"
[1] 0.110298
[1] "FIT401"
[1] 0.002506818
[1] "FIT501"
[1] 0.0616117
[1] "FIT502"
[1] 0.1178485
[1] "FIT503"
[1] 0.0006782029
[1] "FIT504"
[1] 0.0001105101
[1] "FIT601"
[1] 0.009305946
NOTE: The numeric value is the variance value'
write.csv(final,file = "~/CS5402/1.csv")
