cleaningFIT301<-function(x){
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
  }
  return(x);
}