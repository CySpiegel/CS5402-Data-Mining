y<-read.csv(file="finalFromLIT101.csv")

final<-y
final$LIT101<-cleaningLIT101(final$LIT101)
final$AIT202<-cleaningAIT202(y$AIT202)
final$AIT203<-cleaningAIT203(y$AIT203)
final$FIT201<-cleaningFIT201(y$FIT201)
final$FIT301<-cleaningFIT301(y$FIT301)
final$LIT301<-cleaningLIT301(y$LIT301)
final$AIT402<-cleaningAIT402(y$AIT402)
final$FIT401<-cleaningFIT401(y$FIT401)
final$LIT401<-cleaningLIT401(y$LIT401)
final$AIT501<-cleaningAIT501(y$AIT501)
final$AIT502<-cleaningAIT502(y$AIT502)
final$AIT503<-cleaningAIT503(y$AIT503)
final$AIT504<-cleaningAIT504(y$AIT504)
final$FIT501<-cleaningFIT501(y$FIT501)
final$FIT502<-cleaningFIT502(y$FIT502)
final$FIT503<-cleaningFIT503(y$FIT503)
final$FIT504<-cleaningFIT503(y$FIT504)
final$PIT501<-cleaningAIT502(y$PIT501)
final$PIT502<-cleaningPIT502(y$PIT502)
final$PIT503<-cleaningAIT502(y$PIT503)
final$FIT601<-cleaningFIT301(y$FIT601)
final$AIT201<-cleaningAIT201(y$AIT201)
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
write.csv(final,file = "~/CS5402/finalFromLIT101Update1.csv")
