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