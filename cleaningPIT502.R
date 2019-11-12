cleaningPIT502<-function(x){
  x<-average(x)
  # the range is created base on the excel and after multiple run the graph
  # this estimated points make sure we can find the outlier
  minRange<-0
  maxRange<-350
  for(i in 1 : NROW(x)){
    if((x[i] < minRange | x[i] > maxRange) )
    {
      
      if(x[i] > maxRange ){
        x[i]<-as.double(x[i]/100)
      }
      if(x[i]<minRange )
        x[i]<-as.double(x[i]*as.double(100))
    }
  }
  
  return(x);  
}
