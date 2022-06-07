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

head(data.filter.ts)

plot(data.filter.ts)
lines(data.filter.ts)




ses.ts <- ses(data.filter.ts, 
              alpha = .2,
              h = 100)
autoplot(ses.ts)


