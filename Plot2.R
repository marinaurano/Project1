install.packages("dplyr")
install.packages("ggplot2")
install.packages(data.table)
library(data.table)
library(dplyr)
library(ggplot2)

dados <- read.table("household_power_consumption.txt", header = TRUE,sep = ";",dec = ".",na.strings = "?")
dados2 <- subset(dados,Date=="1/2/2007")
dados3 <- subset(dados,Date=="2/2/2007")
dadosfinais <- bind_rows(dados2,dados3)
dadosfinais$Date = as.Date(dadosfinais$Date, '%d/%m/%Y')
dadosfinais$Date_and_Time <- strptime(paste(dadosfinais$Date, dadosfinais$Time), "%Y-%m-%d %H:%M:%S")
str(dadosfinais)
plot(dadosfinais$Date_and_Time, dadosfinais$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")

dev.copy(png, file="plot2.png")
dev.off()

