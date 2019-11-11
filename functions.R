#library needed
library(caret)
library(corrplot)
library(ggplot2)

# Replace the value with the one above it
replaceWithPrecedingValue <- function(x)
{
  for (i in 1:length(x))
  {
    if(is.na(x[i]))
    {
      x[i] = x[i - 1]
    }
  }
  x
}

# Replace NA with median value
medianReplaceNA <- function(x)
{
  value <- median(x, na.rm = TRUE)
  x[is.na(x)] <- value
  x
}

replaceWithMode <- function(x) {

}

#When SD is high replace with median
#when SD is low replace with mean

# var(dad$column, na.rm=TRUE)


# Decimal adjustment to hundred
ShiftDecimalPlacesToHundreds <- function(x){
for (i in 1:length(x)) {
    if(!is.na(x[i])) {
      if(x[i] > 10000 && x[i] < 100000)
      {
        v <- x[i] / 100
        x[i] <- v
      }
      
      if(x[i] > 1000 && x[i] < 10000) {
        v <- x[i] / 10
        x[i] <- v
      }
      
      if(x[i] > 10 && x[i] < 100) {
        v <- x[i] * 10
        x[i] <- v
      }
      
      if (x[i] > 1 && x[i] < 10) {
        v <- x[i] * 100
        x[i] <- v
        
      }
      if(x[i] > 0.1 && x[i] < 1)
      {
        v <- x[i] * 1000
        x[i] <- v
      }
      
      if (x[i] > 0.01 && x[i] < 0.1) {
        v <- x[i] * 10000
        x[i] <- v
      }
    }
  }
  x
}


# Decimal adjustment to Tens
ShiftMyDecimalPlacesToTens <- function(x){
  for (i in 1:length(x)) {
    if(!is.na(x[i])) {
      if(x[i] > 10000 && x[i] < 100000)
      {
        v <- x[i] / 1000
        x[i] <- v
      }
      
      if(x[i] > 1000 && x[i] < 10000) {
        v <- x[i] / 100
        x[i] <- v
      }
      
      if(x[i] > 100 && x[i] < 1000) {
        v <- x[i] / 10
        x[i] <- v
      }
      
      if(x[i] > 10 && x[i] < 100) {
        v <- x[i] * 1
        x[i] <- v
      }
      
      if (x[i] > 1 && x[i] < 10) {
        v <- x[i] * 10
        x[i] <- v
        
      }
      if(x[i] > 0.1 && x[i] < 1)
      {
        v <- x[i] * 100
        x[i] <- v
      }
      
      if (x[i] > 0.01 && x[i] < 0.1) {
        v <- x[i] * 1000
        x[i] <- v
      }
    }
  }
  x
}



# Decimal adjustment to Ones
ShiftDecimalPlacesToOnes <- function(x){
  for (i in 1:length(x)) {
    if(!is.na(x[i])) {
      if(x[i] > 10000 && x[i] < 100000)
      {
        v <- x[i] / 10000
        x[i] <- v
      }
      
      if(x[i] > 1000 && x[i] < 10000) {
        v <- x[i] / 1000
        x[i] <- v
      }
      
      if(x[i] > 100 && x[i] < 1000) {
        v <- x[i] / 100
        x[i] <- v
      }
      
      if(x[i] > 10 && x[i] < 100) {
        v <- x[i] / 10
        x[i] <- v
      }
      
      if (x[i] > 1 && x[i] < 10) {
        v <- x[i] * 1
        x[i] <- v
        
      }
      if(x[i] > 0.1 && x[i] < 1)
      {
        v <- x[i] * 10
        x[i] <- v
      }
      
      if (x[i] > 0.01 && x[i] < 0.1) {
        v <- x[i] * 100
        x[i] <- v
      }
    }
  }
  x
}

# Replace N with 0, Y with 1
YNReplace <- function(x)
{
  for (i in 1:length(x)) {
    if(!is.na(x[i])) {
      if(x[i] == "N"){
        x[i] = 0
      }
      if(x[i] == "Y") {
        x[i] =1
      }
    }
  }
  x
}


# Numarical Data to Nominal data, only use for pumps 
NumaricToNominal12 <- function(x)
{
  for (i in 1:length(x)) {
    if(!is.na(x[i])) {
      if(x[i] == 2){
        x[i] = "on"
      }
      if(x[i] == 1) {
        x[i] = "off"
      }
    }
  }
  x
}


# Leos decimal replacer
LeoAverageNAReplace<-function(x){
  for( i in 1:length(x)){
    ifelse(is.na(x[i]),x[i]<-(x[i-1]+x[i-1])/2,x[i])
  }
  return(x)
}


# Fix column AIT402
changeDecimaAIT402 <- function(x){
  for(i in 1 : NROW(x)){
    ifelse(x[i]<=1&x[i]>=0.0999999,x[i]<-x[i]*100,
           ifelse(x[i]<0.0999999,x[i]<-x[i]*1000,
                  ifelse(x[i]>100,x[i]<-x[i]/100,x[i])))  
  }
  for(i in 1:NROW(x)){
    ifelse(x[i]<100 & abs(x[i]-x[i-1])>20,x[i]<-x[i]/10,x[i])
  }
  return(x);
}