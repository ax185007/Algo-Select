library(fpp2)
library(fma)
library(lubridate)
library(dplyr)
library(forecast)



# Preprocess data
data <- read.csv(file = "Data/supermarket_sales - Sheet1.csv")

data.filter <- filter(data, data[ ,2] == 'A')
data.filter <- filter(data.filter, data.filter[ ,4] == 'Member')
data.filter <- filter(data.filter, data.filter[ ,6] == 'Health and beauty')

data.filter <- data.filter %>%
  select("Date", "Total")

data.filter <- data.filter[order(as.Date(data.filter$Date, format="%m/%d/%Y")),]


data.filter.ts <- ts(data.filter[ ,-1], frequency = length(data.filter[ ,1]), start = c(1, 1, 2019), end = c(3, 31, 2019))#, end = c(3, 31, 2019))

dfts <- data.filter.ts


# Detect seasonailty
fit1 <- ets(dfts)
fit2 <- ets(dfts, model = "ANN")
deviance <- 2*c(logLik(fit1) - logLik(fit2))
df <- attributes(logLik(fit1))$df - attributes(logLik(fit2))$df
#P value
p <- 1-pchisq(deviance,df)
print(p)

# method 2 
fit <- tbats(dfts)
s <- !is.null(fit$seasonal)
print(s)