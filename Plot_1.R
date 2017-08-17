#######################################
#Plot 1
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

#Plot histogramm
hist(february$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

#Save File
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


