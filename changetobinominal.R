createRangeNominal<-function(dataset){
  #only change data value to nominal when the variance has big value which It
  # is continous data
    rangeColumn=c(0,0)
    tempdataset<-sort(dataset)
    dividedValue<-ceiling(NROW(tempdataset)/3)
    rangeColumn[1]<-tempdataset[dividedValue]
    rangeColumn[2]<-tempdataset[dividedValue+dividedValue]
    dataset<-ifelse(dataset<=rangeColumn[1],paste("LT",toString(rangeColumn[1])),
                    ifelse(dataset>rangeColumn[1]&dataset<=rangeColumn[2],paste("GT",toString(rangeColumn[1]),"&LT",toString(rangeColumn[2])),paste("GT",toString(rangeColumn[2])))) 
    
  return(dataset)
}