load.data <- function() {
        file <- "~/Documents/Coursera/Data_Science_Specialization/R_Working_Directory/household_power_consumption.txt" 
        data <- read.table(file, sep=";", header=TRUE, col.names= c("Date", "Time", "Global_active_power", 
                                                                    "Global_reactive_power", "Voltage", "Global_Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                           colClasses = c("character", "character", rep("numeric",7)), na.strings= "?")
        feb1 <- data[data$Date == "2007-02-01",]
        feb2 <- data[data$Date == "2007-02-02",]
        feb.days <- rbind(feb1, feb2)
}

plot4 <- function(){
        par(mfcol=c(2,2), mar= c(4,4,2,2), cex=0.65)
        #1st plot
        plot(feb.days$datetime, feb.days$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab= "")
        
        #2nd plot: make empty plot
        plot(feb.days$datetime, feb.days$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab= "")
                #add points piecewise in respective color
                points(feb.days$datetime, feb.days$Sub_metering_1, col= "black", type="l")
                points(feb.days$datetime, feb.days$Sub_metering_2, col= "red", type="l")
                points(feb.days$datetime, feb.days$Sub_metering_3, col= "blue", type="l")
                #add legend
                legend("topright", legend = names(feb.days[7:9]), bty = "n", col = c("black", "red", "blue"), lty=1) 
        
        #3rd plot
        plot(feb.days$datetime, feb.days$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
        
        #4th plot
        plot(feb.days$datetime, feb.days$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
        
        dev.copy(png, file = "plot4.png")
        dev.off()
}