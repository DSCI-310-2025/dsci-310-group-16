#putting some sample data for testing
test_bike_data <- tibble(
    cnt= c(10:1, 1:10),
    season = rep(1:4,5),
    temp = rnorm(20),
    weathersit = rep(1:2,10)
)