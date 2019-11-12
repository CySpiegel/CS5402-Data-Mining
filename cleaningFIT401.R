cleaningFIT401<-function(x){
    x<-average(x)
    # the range is created base on the excel and after multiple run the graph
    # this estimated points make sure we can find the outlier
    minRange<-0.6
    maxRange<-0.9
    for(i in 2 : NROW(x)){
      if((x[i] < minRange | x[i] > maxRange) )
      {

        if(x[i] > maxRange ){
          x[i]<-as.double(x[i]/100)
        }
          if(x[i]<minRange )
            x[i]<-as.double(x[i]*as.double(100))
      }
    }
    #run one more time to bump up all missing data if they
    # placed wrong decimal point
    #We know the valve can be have two value with difference values
    # we tried plot them multiple times and check back to dataset
    for(i in 1:NROW(x)){
      if(x[i]>0.9){
        x[i]<-x[i]/100
      }
    }
    
    return(x);
  }