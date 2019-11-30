
cleaningColumns<-function(x){
  minRange<-0
  maxRange<-0
  counter<-1 
  if(is.na(x[1])){

   
    while(is.na(x[counter])){
      counter<- counter +1

    }
   
    minRange<-x[counter]*0.5
    maxRange<-x[counter]*1.5
    
    counter<-1 
  }else{
    print(counter)
    minRange<-x[1]*0.5
    maxRange<-x[1]*1.5
  }

  for(i in 2 : NROW(x)){
    if(!is.na(x[i])){
      prev<-0
      if(is.na(x[i-1])){
        counter<-(i-1)
        while(is.na(x[counter])){
          counter<- counter -1
        }
        prev<-x[counter]
      }else{
        prev<-x[i-1]
      }
      if((x[i] < minRange | x[i] > maxRange) )
      {
        if(x[i] > prev ){
          x[i]<-as.double(x[i]/100)
        }else{
          if(x[i] < prev )
            x[i]<-as.double(x[i]*as.double(100))
        }
      }else {
        x[i]<-x[i]
      }
      minRange<-x[i]*0.9
      maxRange<-x[i]*1.1
    }

  }
  return(x);
}