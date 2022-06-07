# Holt Winter’s Exponential Smoothing (HWES) 
library(dplyr)
library(ggplot2)
library(ISLR) 
library(tidyverse)
library(lubridate)

# Preprocess data
data <- read.csv(file = "./Data/supermarket_sales - Sheet1.csv")
data <- data %>%
    select("Date", "Total")
data <- data[order(as.Date(data$Date, format="%m/%d/%Y")),]
print(data)


#data <- aggregate(data["Total"], data["Date"], sum)
#print(data)

dfts <- ts(data, frequency=12, start=c(1,1,2019), end=c(3,30,2019))
components <- decompose(dfts)
#plot(components)
HW1 <- HoltWinters(dfts)
HW2 <- HoltWinters(dfts, alpha=0.2, beta=0.1, gamma=0.1)

plot(dfts, ylab="sales")
lines(HW1$fitted[,1],lty=2, col="blue")
lines(HW2$fitted[,1],lty=2, col="red")

ggplot(data, aes(x = Date, y = Total)) +
      geom_line(color = "darkorchid4") +
      facet_wrap(~City) +
      labs(title = "Total Sales",
           subtitle = "Data plotted by City",
           y = "Total Sales",
           x = "Day of Year") + theme_bw(base_size = 15)



  
# Apply HWES

# Generate Plots
