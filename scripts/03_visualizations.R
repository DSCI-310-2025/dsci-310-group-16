library(tidyverse)
library(tidymodels)
library(ggplot2)
library(ggpubr)
library(corrplot)
library(docopt)
library(predict.bike)

"This script loads, cleans, saves titanic data

Usage: 02_clean_data.R --file_path=<file_path> --output_dir=<output_dir>
" -> doc

opt <- docopt(doc)

bike_data <- read.csv(opt$file_path)

## Exploratory data analysis
temp_vs_rentals = make_scatter(bike_data, "temp", "cnt", "Temperature", "Total Bike Rentals", "Temperature vs Bike Rentals", "blue")

weather_vs_cnt = make_bar(bike_data, "weathersit", "cnt", "weathersit", 
"Bike Rentals by \nWeather Situation", "Weather Situation", "Total Bike Rentals",
c("Clear/Partly Cloudy", "Mist and Cloudy", "Light Percipitation", "Heavy Percipitation"))

season_vs_cnt = ggplot(bike_data, aes(x = factor(season), y = cnt)) +
  geom_boxplot(fill = "lightgreen", color = "black", alpha = 0.7) +
  labs(title = "Bike Rentals by Season", x = "Season", y = "Total Bike Rentals")

weekday_rental = make_bar(bike_data, "weekday", "cnt", "weekday", "Bike Rentals by Weekday", "Weekday", "Total Bike Rentals",
c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

humidty_rental = make_scatter(bike_data, "hum", "cnt", "Humidity", "Total Bike Rentals", "Humidity vs Bike Rentals", "purple")

wind_rental = make_scatter(bike_data, "windspeed", "cnt", "Wind Speed", "Total Bike Rentals", "Wind Speed vs Bike Rentals", "green")

exploratory = ggarrange(temp_vs_rentals, weather_vs_cnt, season_vs_cnt, weekday_rental, humidty_rental, wind_rental)
save_plot("exploratory.png", opt$output_dir, 15)
#ggsave("exploratory.png", path=opt$output_dir, width = 15)

total_rentals = ggplot(bike_data,aes(x = cnt))+
geom_histogram(binwidth = 10, fill = "blue",color = "black",alpha = 0.7)+
labs(title = "Histogram of the total bike rentals", x = "Total rentals")

save_plot("total.png", opt$output_dir, 8)
#ggsave("total.png", path=opt$output_dir)

output_file = file.path(path = opt$output_dir, "cor_plot.png")
cor = cor(bike_data %>% select(temp, atemp, hum, windspeed, casual, registered, cnt))
png(output_file)
corrplot(cor)
dev.off()
