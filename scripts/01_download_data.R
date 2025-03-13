library(ucimlrepo)
dataframe <- fetch_ucirepo(id = 275)
dataframe <- dataframe$data$original
destination <- "data/raw/bike_data.csv"
write.csv(dataframe, destination)



