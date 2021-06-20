install.packages("dplyr")
install.packages("ggplot2")
install.packages("magrittr")
install.packages("multipanelfigure")
library(ggplot2)
library(dplyr)
library(multipanelfigure)
library(magrittr)

dados <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", dec = ",")
dados2 <- subset(dados,Date=="1/7/2007")
dados3 <- subset(dados,Date=="2/7/2007")
dadosfinais <- bind_rows(dados2,dados3)
dadosfinais$Sub_metering_1 <- as.numeric(dadosfinais$Sub_metering_1)
dadosfinais$Sub_metering_2 <- as.numeric(dadosfinais$Sub_metering_2)
dadosfinais$Sub_metering_3 <- as.numeric(dadosfinais$Sub_metering_3)


ggplot(dadosfinais, aes(x=Time))+geom_line(aes(y=Sub_metering_1))+geom_line(aes(y=Sub_metering_2),colour="red")+geom_line(aes(y=Sub_metering_3),colour="blue") + ylab("Energy sub metering")


dev.copy(png, file="plot3.png")
dev.off()
