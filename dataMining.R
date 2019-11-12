
createRange<-function (x){
  rangeColumn=c(0,0)
  x<-sort(x)
  dividedValue<-ceiling(NROW(x)/3)
  rangeColumn[1]<-x[dividedValue]
  rangeColumn[2]<-x[dividedValue+dividedValue]
  return(rangeColumn)
}


createRangeNominal<-function(dataset){
  rangeColumn=c(0,0)
  tempdataset<-sort(dataset)
  dividedValue<-ceiling(NROW(tempdataset)/3)
  rangeColumn[1]<-tempdataset[dividedValue]
  rangeColumn[2]<-x[dividedValue+dividedValue]
  dataset<-ifelse(dataset<=range[1],"LOW",
                  ifelse(dataset>range[1]&dataset<=range[2],"MEDIUM","HIGH")) 
  return(dataset)
}


