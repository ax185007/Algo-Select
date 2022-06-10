# Holt Winter’s Exponential Smoothing (HWES) 
library(dplyr)
library(ggplot2)
library(ISLR)
library(tidyverse)
library(lubridate)
library(forecast)

# Preprocess data
data <- read.csv(file = "./Data/supermarket_sales - Sheet1.csv")
data <- data %>%
    select("Date", "Total")
data <- data[order(as.Date(data$Date, format="%m/%d/%Y")),]
print(data)
dfts <- ts(data, frequency=12, start=c(1,1,2019), end=c(3,30,2019))
#print(dfts)
# Apply HWES
components <- decompose(dfts)
HW1 <- HoltWinters(dfts)
HW2 <- HoltWinters(dfts, alpha=0.2, beta=0.1, gamma=0.1)


HW1.pred <- predict(HW1, 5, prediction.interval = TRUE, level=0.95)
#Visually evaluate the prediction
plot(dfts, ylab="Total Sales", xlim = c(c(1,2019),c(3,2019)))
lines(HW1$fitted[,1], lty=2, col="blue")
lines(HW1.pred[,1], col="red")
lines(HW1.pred[,2], lty=2, col="orange")
lines(HW1.pred[,3], lty=2, col="orange")

