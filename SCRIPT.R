# Set Working Directory setwd(H:/"sta215")
setwd("H:/sta215")

# Install "haven" package 
install.packages("haven")

# Load "haven" package 
library(haven)
library(psych)
library(dplyr)

# Load Rawdata as an object called "data"
Rawdata <- read.csv("Rawdata.csv")

data <- Rawdata %>%
  filter(complete.cases(.))

# Create a contingency table
contingency_table <- table(data$gender, data$grammy)
print(contingency_table)

chisq.test(data$gender, data$grammy)

#descriptive
mean(data$streams)
sd(data$streams)
min(data$streams)
max(data$streams)

#descriptive
mean(data$album_sales)
sd(data$album_sales)
min(data$album_sales)
max(data$album_sales)

#descriptive
mean(data$bpm)
sd(data$bpm)
min(data$bpm)
max(data$bpm)

#descriptive
mean(data$fanbase)
sd(data$fanbase)
min(data$fanbase)
max(data$fanbase)

#descriptive
mean(data$instrument_number)
sd(data$instrument_number)
min(data$instrument_number)
max(data$instrument_number)

#descriptive
mean(data$release_year)
sd(data$release_year)
min(data$release_year)
max(data$release_year)

# descriptive
mean(data$song_length)
sd(data$song_length)
min(data$song_length)
max(data$song_length)
describe(data$song_length)

# descriptive
mean(data$use_in_media)
sd(data$use_in_media)
min(data$use_in_media)
max(data$use_in_media)
describe(data$use_in_media)

# Qualitative variables
table(data$gender)
table(data$pop)
table(data$rock)
table(data$rap)
table(data$country)
table(data$hip_hop)
table(data$alt.)
table(data$reggae)
table(data$r.b) 
table(data$sad)
table(data$happy)
table(data$angry)
table(data$hopeful)
table(data$romantic)
table(data$ashamed)
table(data$fearful)
table(data$desperatation)
table(data$grammy)
table(data$vma)
table(data$mtv) 
table(data$ama)
table(data$billboard_music_award)
table(data$key) 
table(data$time_signature)

# figure 1
lm(time_signature ~ bpm, data=data)
aov(time_signature ~ bpm, data=data)
summary(time_signature ~ bpm, data=data)
boxplot(time_signature ~ bpm, data=data)

# Figure 2
plot(album_sales ~ song_length, data=data)
linear_regression <- lm(album_sales ~ song_length, data=data)
summary(linear_regression) 
summary(album_sales ~ song_length, data=data)
abline(linear_regression)
mean_length <- mean(data$song_length)
mean_album_sales <- mean(data$album_sales)
abline(v = mean_length, col = "purple")
abline(h = mean_album_sales, col = "green")

hist(residuals(linear_regression))
# Figure 3
plot(data$song_length, residuals(linear_regression))
abline(h=0, col = "red")
