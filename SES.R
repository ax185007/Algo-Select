#Simple Exponential Smoothing (SES)
data <- read.csv("Data/supermarket_sales - Sheet1.csv")

data.ts <- ts(data[ ,-1], frequency = 12, start = c(2019, 1, 1))
head(data.ts)

plot(data.ts[ ,9], data.ts[ ,8])
