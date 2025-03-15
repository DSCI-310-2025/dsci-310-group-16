library(tidyverse)
library(tidymodels)
library(ggplot2)
library(ggpubr)
library(corrplot)
library(docopt)

"This script loads, cleans, saves titanic data

Usage: 02_clean_data.R --file_path=<file_path> --output_dir=<output_dir>
" -> doc

opt <- docopt(doc)

bike_data <- read.csv(opt$file_path)

## Exploratory data analysis

temp_vs_rentals = ggplot(bike_data, aes(x = temp, y = cnt)) +
  geom_point(color = "blue", alpha = 0.5) +
  theme_minimal() +
  labs(title = "Temperature vs Bike Rentals", x = "Temperature", y = "Total Bike Rentals")


weather_vs_cnt = ggplot(bike_data, aes(x = factor(weathersit), y = cnt, fill = factor(weathersit))) +
  geom_bar(stat = "identity") +
  scale_x_discrete(labels=c("Clear/Partly Cloudy", "Mist and Cloudy", "Light Percipitation", "Heavy Percipitation")) +
  labs(title = "Bike Rentals by \nWeather Situation", x = "Weather Situation", y = "Total Bike Rentals") +
  theme(axis.text.x = element_text(angle = 70, vjust = 0.5))


season_vs_cnt = ggplot(bike_data, aes(x = factor(season), y = cnt)) +
  geom_boxplot(fill = "lightgreen", color = "black", alpha = 0.7) +
  labs(title = "Bike Rentals by Season", x = "Season", y = "Total Bike Rentals")

weekday_rental = ggplot(bike_data, aes(x = factor(weekday), y = cnt, fill = factor(weekday))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  scale_fill_viridis_d() +
  scale_x_discrete(labels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")) +
  labs(title = "Bike Rentals by Weekday", x = "Weekday", y = "Total Bike Rentals") +
  theme(axis.text.x = element_text(angle = 70, vjust = 0.5))

humidty_rental = ggplot(bike_data, aes(x = hum, y = cnt)) +
  geom_point(color = "purple", alpha = 0.5) +
  labs(title = "Humidity vs Bike Rentals", x = "Humidity", y = "Total Bike Rentals") +
  theme(axis.text.x = element_text(angle = 70, vjust = 0.5))

wind_rental = ggplot(bike_data, aes(x = windspeed, y = cnt)) +
  geom_point(color = "green", alpha = 0.5) +
  theme_minimal() +
  labs(title = "Windspeed vs Bike Rentals", x = "Wind Speed", y = "Total Bike Rentals")


exploratory = ggarrange(temp_vs_rentals, weather_vs_cnt, season_vs_cnt, weekday_rental, humidty_rental, wind_rental)

show(exploratory)
ggsave("exploratory.png", path=opt$output_dir, width = 15)

total_rentals = ggplot(bike_data,aes(x = cnt))+
geom_histogram(binwidth = 10, fill = "blue",color = "black",alpha = 0.7)+
labs(title = "Histogram of the total bike rentals", x = "Total rentals")

show(total_rentals)
ggsave("total.png", path=opt$output_dir)

output_file = file.path(path = opt$output_dir, "cor_plot.png")
cor = cor(bike_data %>% select(temp, atemp, hum, windspeed, casual, registered, cnt))
png(output_file)
corrplot(cor)
dev.off()
