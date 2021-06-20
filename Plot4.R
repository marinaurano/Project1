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
dadosfinais$Global_active_power <- as.numeric(dadosfinais$Global_active_power)
dadosfinais$Voltage <- as.numeric(dadosfinais$Voltage)
dadosfinais$Global_reactive_power <- as.numeric(dadosfinais$Global_reactive_power)
dadosfinais$Sub_metering_1 <- as.numeric(dadosfinais$Sub_metering_1)
dadosfinais$Sub_metering_2 <- as.numeric(dadosfinais$Sub_metering_2)
dadosfinais$Sub_metering_3 <- as.numeric(dadosfinais$Sub_metering_3)

fig11 <- ggplot(dadosfinais, aes(x=Time, y=Global_active_power)) + geom_line() + ylab("Global Active Power")
fig12 <- ggplot(dadosfinais, aes(x=Time, y=Voltage)) + geom_line() + ylab("Voltage")
fig21 <- ggplot(dadosfinais, aes(x=Time))+geom_line(aes(y=Sub_metering_1))+geom_line(aes(y=Sub_metering_2),colour="red")+geom_line(aes(y=Sub_metering_3),colour="blue") + ylab("Energy sub metering")
fig22 <- ggplot(dadosfinais, aes(x=Time, y=Global_reactive_power)) + geom_line() + ylab("Global Reactive Power")

plot4 <- multi_panel_figure(columns = 2, rows = 2, panel_label_type = "none")
plot4 %<>%
  fill_panel(fig11, column = 1, row = 1) %<>%
  fill_panel(fig12, column = 2, row = 1) %<>%
  fill_panel(fig21, column = 1, row = 2) %<>%
  fill_panel(fig22, column = 2, row = 2)
plot4
dev.copy(png, file="plot4.png")
dev.off()
