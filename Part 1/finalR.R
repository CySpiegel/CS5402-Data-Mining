y<-read.csv(file="~/CS5402/5402_datasetEdit5.csv")

columnsName<-colnames(y)
final<-y
#16 which column start from LIT101
for(i in 17:NROW(columnsName)){
    print(columnsName[i])
    final[i]<-cleaningColumns(final[[i]])
    final[i]<-average(final[[i]])
    print(var(final[[i]]))
    if(var(final[[i]]) >1){
      final[i]<-createRangeNominal(final[[i]])
    }
}
View(final)
final<-applyMethodToAllColumn(final)

'Delete Columns because variance of these collumn were close to 0 which their data are the same to 
entire of datase:
[1] "AIT202"
[1] 0.110298
[1] "FIT401"
[1] 0.002506818
[1] "FIT501"
[1] 0.0616117
[1] "FIT502"
[1] 0.1178485
[1] "FIT503"
[1] 0.0006782029
[1] "FIT504"
[1] 0.0001105101
[1] "FIT601"
[1] 0.009305946
NOTE: The numeric value is the variance value'
write.csv(final,file = "~/CS5402/1.csv")
