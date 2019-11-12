cleaningAIT203<-function(x){
  #fill out all na values
  x<-average(x)
  fix<-FALSE
  for(i in 1 : NROW(x)){
    minRange<-100
    maxRange<-999
    
    if((x[i] < minRange | x[i] > maxRange) )
    {
      if ((x[i]<minRange | x[i]>maxRange) ) {
        if(x[i] > x[i-1]){
          
          x[i]<-as.double(x[i]/100.00000)
        }else{
          if(x[i] < x[i-1] ){
            x[i]<-as.double(x[i]*as.double(100.0000))
          }
        }
      } 
    }
  }
  return(x);
  
}
