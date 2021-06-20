install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

dados <- read.table("household_power_consumption.txt", header = TRUE,sep = ";", dec = ",")
dados2 <- subset(dados,Date=="1/7/2007")
dados3 <- subset(dados,Date=="2/7/2007")
dadosfinais <- bind_rows(dados2,dados3)
dadosfinais$Global_active_power <- as.numeric(dadosfinais$Global_active_power)
ggplot(dadosfinais, aes(x=Time, y=Global_active_power)) + geom_line() + ylab("Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()

