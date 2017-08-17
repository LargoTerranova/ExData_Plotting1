#######################################
#Plot 3
#######################################
#Set Working Directory
setwd("")

#Read in Data
electro <- read.table("power.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Change Date so it can find the dates
electro$Date <- as.Date(electro$Date, format= "%d/%m/%Y")

#Subset
february <- subset(electro, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Change Time
timestamp <- paste(as.Date(february$Date), february$Time)
february$new_time <- as.POSIXct(timestamp)

#Plot Graph
plot(y = february$Sub_metering_1, x = february$new_time, type="l", ylab="Energy sub metering", xlab = "")
lines(y = february$Sub_metering_2, x=february$new_time, col="red")
lines(y=february$Sub_metering_3, x = february$new_time, col="blue")

dev.copy(png, file="plot3.png", height=480, width=480)

legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid", cex =0.9)

dev.off()
