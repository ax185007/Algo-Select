#Simple Exponential Smoothing (SES)
library(dplyr)

data <- read.csv("Data/supermarket_sales - Sheet1.csv")


#data <- data %>%
 # select("Date", "Total")
#data <- data[order(as.Date(data$Date, format="%m/%d/%Y")),]
#print(data)


#data.ts <- ts(data[ ,-1], start = c(2019, 1, 1))


#data.filter <- data[order(as.Date(data[ ,11], format="%m/%d/%Y")),]
data.filter <- filter(data, data[ ,2] == 'A')
data.filter <- filter(data.filter, data.filter[ ,4] == 'Member')
data.filter <- filter(data.filter, data.filter[ ,6] == 'Health and beauty')


data.filter.ts <- ts(data.filter[ ,-1], frequency = 12, start = c(1, 1, 2019))#, end = c(3, 31, 2019))

data.filter.ts <- data.filter.ts[order(data.filter.ts[ ,10]), ]

head(data.filter.ts)

plot(x = data.filter.ts[ ,10], y = data.filter.ts[ ,9])
lines(data.filter.ts)

#head(data.ts)

#plot(x = data.ts[ ,10], y = data.ts[ ,9])

df[order(-df$service_price),]

     