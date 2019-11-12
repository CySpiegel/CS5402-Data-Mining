cleaningAIT402<-function(x){
  x<-average(x)
  minRange<-x[1]*0.9
  maxRange<-x[1]*1.1
  for(i in 2 : NROW(x)){
    if((x[i] < minRange | x[i] > maxRange) )
    {
      if(x[i] > x[i-1] ){
        x[i]<-as.double(x[i]/100)
      }else{
        if(x[i]<x[i-1] )
          x[i]<-as.double(x[i]*as.double(100))
      }
    }
    minRange<-x[i]*0.9
    maxRange<-x[i]*1.1
  }
  #run one more time to bump up all missing data if they
  # placed wrong decimal point
  #We know the valve can be have two value with difference values
  # we tried plot them multiple times and check back to dataset
  for(i in 1:NROW(x)){
    if(x[i]<100){
      x[i]<-x[i]*100
    }
  }
  return(x);
}