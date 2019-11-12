cleaningLIT301<-function(x){
  x<-average(x)
  minRange<-x[1]*0.6
  maxRange<-x[1]*1.1
  for(i in 2 : NROW(x)){
    if((x[i] < minRange | x[i] > maxRange) )
    {
      if(x[i] > x[i-1] | x[i]>maxRange){
        x[i]<-as.double(x[i]/100.00000)
      }else{
        if(x[i]<x[i-1] | x[i]<maxRange)
          x[i]<-as.double(x[i]*as.double(100.0000))
      }
    }
    minRange<-x[i]*0.6
    maxRange<-x[i]*1.1
  }
  #run one more time to bump up all missing data if they
  # placed wrong decimal point
  for(i in 1:NROW(x)){
    if(x[i]<200){
      x[i]<-x[i]*100
    }
  }
  return(x);
}