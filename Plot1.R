install.packages("dplyr")
library(dplyr)

dados <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", dec = ",", na.strings = "?")
dados$Date_and_Time <- strptime(paste(dados$Date, dados$Time), "%Y-%m-%d %H:%M:%S")
str(df)
dados2 <- subset(dados,Date=="1/2/2007")
dados3 <- subset(dados,Date=="2/2/2007")
dadosfinais <- bind_rows(dados2,dados3)
dadosfinais$Global_active_power <- as.numeric(dadosfinais$Global_active_power)
hist(dadosfinais$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power", col="red")

dev.copy(png, file="plot1.png")
dev.off()
