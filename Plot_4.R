#######################################
#Plot 4
#######################################
#Set Working Directory
setwd("C:/Users/boband/Google Drive/DataScience/4_Explo/1_Week/wd/")

#Read in Data
electro <- read.table("power.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Change Date so it can find the dates
electro$Date <- as.Date(electro$Date, format= "%d/%m/%Y")

#Subset
february <- subset(electro, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Change Time
timestamp <- paste(as.Date(february$Date), february$Time)
february$new_time <- as.POSIXct(timestamp)


#Pratition Graph
par(mfrow=c(2,2))


#Plot 1
with(february, plot(x = new_time, 
                    y = Global_active_power, 
                    type = "l",
                    ylab = "Global Active Power",
                    xlab = ""))


#Plot 2
plot(february$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")


#Plot 3
plot(y = february$Sub_metering_1, x = february$new_time, type="l", ylab="Energy sub metering", xlab = "")
lines(y = february$Sub_metering_2, x=february$new_time, col="red")
lines(y=february$Sub_metering_3, x = february$new_time, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid", cex = 0.1)



#Plot 4
plot(y = february$Global_reactive_power, x = february$new_time, type = "l", xlab = "datetime", ylab = "Global_reactive_power")



#Save
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

