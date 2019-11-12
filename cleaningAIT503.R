cleaningAIT503<- function(x){
  x<-average(x)
  # the range is created base on the excel and after multiple run the graph
  # this estimated points make sure we can find the outlier
  minRange<-x[1]-100
  maxRange<-x[1]+1000
  fix<-FALSE
  for(i in 2 : NROW(x)){
    if((x[i] < minRange | x[i] > maxRange) )
    {
      
      while(x[i] > maxRange ){
        if(x[i]>maxRange)
        {
          x[i]<-as.double(x[i]/10)
        }else{
          fix<-TRUE
        }
      }
      while(x[i]< minRange & fix==FALSE)
        x[i]<-as.double(x[i]*as.double(10))
      fix<-FALSE
    }
  }
  
  #this loop will run through and fix small issue from loop above
  for(i in 1: NROW(x)){
    if( x[i]/100==1){
      x[i]<-x[i]*10
    }
  }
  return(x);  
}