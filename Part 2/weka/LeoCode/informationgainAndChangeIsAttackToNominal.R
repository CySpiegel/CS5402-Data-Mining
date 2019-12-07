y<-read.csv(file="~/CS5402/HW8/hw8_data.csv")
is_attact<-y$is_attack
is_attact<-ifelse(is_attact==0,'no','yes')
y$is_attack<-is_attact
information.gain(is_attack~.,y)
write.csv(y,file="~/CS5402/HW8/test2R.csv")