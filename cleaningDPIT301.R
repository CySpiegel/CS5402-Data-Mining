cleaningDPIT301<-function(x){
  #fill out all na values
  x<-average(x)
  for(i in 1 : NROW(x)){
    minRange<-1
    maxRange<-100
    
    if((x[i] < minRange | x[i] > maxRange) )
    {
      if ((x[i]<minRange | x[i]>maxRange) ) {
        if(x[i] > x[i-1] | x[i]>maxRange){
          x[i]<-as.double(x[i]/100.00000)
        }else{
            if(x[i]<x[i-1] | x[i]<maxRange)
            x[i]<-as.double(x[i]*as.double(100.0000))
          }
        }
      } 
    }
  return(x);
}
