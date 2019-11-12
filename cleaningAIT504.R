cleaningAIT504<- function(x){
  x<-average(x)
  # the range is created base on the excel and after multiple run the graph
  # this estimated points make sure we can find the outlier
  minRange<-x[1]*0.01
  maxRange<-x[1]*2
  fix<-FALSE
  for(i in 2 : NROW(x)){
      if(x[i]>maxRange){
        x[i]<- x[i]/100
      }else{
        if(x[i] < minRange){
          x[i]<- x[i]*100
        }  
      }
  }
  return(x);  
}