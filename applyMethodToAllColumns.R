
#function to detect valid range of the dataset whether is in one number place
# or two number places

applyMethodToAllColumn<-function(x){
  columnsName<-colnames(x)
  #18 which column start from LIT101
  for(i in 18:NROW(columnsName)){
    if(var(x[i])>1 && !is.na(x[i])){
      print(var(x[i]))
      x[i]<-createRangeNominal(x[[i]])
    }
    
  }
 return(x)
}
