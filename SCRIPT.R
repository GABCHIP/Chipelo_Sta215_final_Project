# Set Working Directory setwd(H:/"sta215")
setwd("H:/sta215")

# Install "haven" package 
install.packages("haven")

# Install "lmtest" package 
install.packages("lmtest")

# Install "sandwich" package
install.packages("sandwich")

# Load "haven" package 
library(haven)
library(psych)
library(dplyr)
library(lmtest)
library(sandwich)

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

# Breush-Pagan Test
bptest(album_sales ~ song_length, data = data)

# Durbin-Watts Test
model <- lm(album_sales ~ song_length, data = data)
dwtest(album_sales ~ song_length, data = data)

# Fit the model
linear_model <- lm(album_sales ~ song_length, data = data)

# Robust Standard Error t-test
data <- data.frame(
  album_sales = c(4, 1, 1, 13, 12, 4.5, 1, 7, 0.5, 0.6, 0.5, 8, 2, 1, 1, 4, 10, 1, 5, 12, 
                  0.5, 5, 2, 3, 3, 10, 3, 10, 9, 8, 10, 6, 2, 3, 11, 0.5, 7, 6, 8, 4, 4.1, 
                  4, 0.5, 1, 0.5, 13, 5, 5, 1, 10, 5, 1, 5, 6, 4, 1, 9, 0.5, 3, 3, 4, 9, 13, 
                  1, 2, 1, 0.5, 9, 10, 1, 6.4, 23, 5, 3, 7, 6, 1, 6, 8, 7, 3, 3, 45, 7, 9, 
                  30, 9, 1, 1, 10, 30, 3, 5, 66, 28, 30, 10, 3, 3, 1, 1, 1, 8, 6, 3, 1, 1, 1, 
                  1, 3, 5, 1, 14, 1, 3, 5, 1, 10, 10, 10),
  song_length = c(281, 233, 259, 326, 199, 215, 340, 242, 348, 291, 246, 204, 262, 280, 235, 171, 
                  222, 262, 209, 227, 334, 251, 172, 225, 227, 215, 246, 311, 221, 224, 276, 264, 
                  267, 206, 223, 209, 222, 262, 208, 241, 192, 155, 295, 221, 212, 233, 198, 181, 
                  257, 217, 198, 212, 258, 219, 212, 243, 192, 234, 245, 213, 334, 210, 263, 172, 
                  244, 213, 207, 178, 241, 200, 215, 190, 290, 211, 236, 262, 211, 288, 220, 276, 
                  215, 223, 210, 253, 235, 275, 276, 237, 214, 256, 208, 216, 213, 202, 258, 211, 
                  250, 266, 264, 263, 241, 190, 245, 270, 227, 242, 175, 215, 258, 236, 210, 216, 
                  284, 213, 225, 202, 234, 202, 243, 263)
)


robust_t_test <- coeftest(linear_model, vcov = vcovHAC(linear_model))
print(robust_t_test)
