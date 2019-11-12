cleaningLIT101<-function(x){
  #fill out all na values
  x<-average(x)
  minRange<-100
  maxRange<-999
  for(i in 1 : NROW(x)){
    if(x[i] < minRange | x[i] > maxRange)
    {
      fix<-FALSE
      while(x[i]<x[i-1] & !fix){
        x[i]<-x[i]*10
        if(x[i]>=minRange & x[i]<maxRange){
          fix<-TRUE
        }
      }
      while(x[i]>x[i-1] & !fix){
        x[i]<-x[i]/10
        if(x[i]>=minRange & x[i]< maxRange){
          fix<-TRUE
        } 
      }
    }
  }
  return(x);
}