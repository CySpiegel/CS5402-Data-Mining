library(SuperLearner)

#load data into frame
data = hw8_data

# Reduce to a dataset random observations.
train_obs = sample(nrow(data), floor(0.66*nrow(data)))
