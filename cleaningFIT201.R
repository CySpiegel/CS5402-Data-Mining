cleaningFIT201<-function(x){
  #fill out all na values
  x<-average(x)
  fix<-FALSE
  minRange<-0.1
  maxRange<-20
  for(i in 2 : NROW(x)){
    fix<-FALSE
    if(x[i]<=0.0009){
      x[i]<-x[i]
    }else{
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