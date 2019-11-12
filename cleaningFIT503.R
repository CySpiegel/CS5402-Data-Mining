cleaningFIT503<- function(x){
  x<-average(x)
  # the range is created base on the excel and after multiple run the graph
  # this estimated points make sure we can find the outlier
  minRange<-x[1]*0.1
  maxRange<-x[1]*1.9
  fix<-FALSE
  for(i in 2 : NROW(x)){
    if(x[i]<0.00009){
      x[i]<-0
    }
    if(x[i]>maxRange){
      x[i]<- x[i]/100
    }else{
      if(x[i] < minRange){
        x[i]<- x[i]*100
      }  
    }
  }
  #this loop is used for fixing issue from loop above
  for(i in 1:NROW(x)){
    if(x[i]<=0.06){
      x[i]<-x[i]*10
    }
  }
  return(x);  
}