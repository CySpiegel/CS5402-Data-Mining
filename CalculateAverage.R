average<-function(x){
  for( i in 1:length(x)){
    counter<-NULL
    if(is.na(x[i]) & !is.na((x[i+1]))){
      x[i]<-(x[i-1]+x[i+1])/2
    }else{
      if(is.na(x[i]) & is.na((x[i+1]))){
        counter<-i
        while(is.na(x[counter])){
          counter<-counter+1
        }
        x[i]<-(x[i-1]+x[i+counter])/2       
      }
      x[i]<-x[i]
    }
  }  
  return(x)
}