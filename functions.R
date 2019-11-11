
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
  v <- median(x, na.rm = TRUE)
  x[is.na(x)] <- v
  x
}

#When SD is high replace with median
#when SD is low replace with mean

# var(dad$column, na.rm=TRUE)

exp_fit_rep <- function(v)
{
  x <- 1:length(v)
  fit <- lm(log(v) ~ x)
  for(i in 1:length(v))
  {
    if(is.na(v[i]))
      v[i] <- exp(predict(fit, data.frame(x = c(i))))
  }
  v 
}


# Decimal adjustment to hundred
fixMyDecimalPlacesHundreds <- function(x){
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
        v <- x[i] * 10000
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
fixMyDecimalPlacesTens <- function(x){
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
        v <- x[i] * 1000
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




