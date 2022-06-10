#Simple Exponential Smoothing (SES)
options("download.file.method"="wininet")
install.packages("fpp2")
install.packages("fracdiff")
install.packages("quadprog")

library(dplyr)
library(fpp2)

data <- read.csv("Data/supermarket_sales - Sheet1.csv")


data.filter <- filter(data, data[ ,2] == 'A')
data.filter <- filter(data.filter, data.filter[ ,4] == 'Member')
data.filter <- filter(data.filter, data.filter[ ,6] == 'Health and beauty')

data.filter <- data.filter %>%
  select("Date", "Total")

data.filter <- data.filter[order(as.Date(data.filter$Date, format="%m/%d/%Y")),]


data.filter.ts <- ts(data.filter[ ,-1], frequency = length(data.filter[ ,1]), start = c(1, 1, 2019), end = c(3, 31, 2019))#, end = c(3, 31, 2019))

#data.filter.ts <- data.filter.ts[order(data.filter.ts[ ,10]), ]

HW1 <- HoltWinters(data.filter.ts)
HW2 <- HoltWinters(data.filter.ts, alpha=0.2, beta=0.1, gamma=0.1)

head(data.filter.ts)
dfts <- data.filter.ts

HW1_for <- forecast(HW1, h=24, level=c(80,95))
#visualize our predictions:
plot(HW1_for, xlim=c(c(), 2020))
lines(HW1_for$fitted, lty=2, col="purple")


ses.ts <- ses(data.filter.ts, 
              alpha = .2,
              h = 100)
#autoplot(ses.ts)

