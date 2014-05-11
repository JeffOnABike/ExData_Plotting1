load.data <- function() {
        file <- "~/Documents/Coursera/Data_Science_Specialization/R_Working_Directory/household_power_consumption.txt" 
        data <- read.table(file, sep=";", header=TRUE, col.names= c("Date", "Time", "Global_active_power", 
                                                                    "Global_reactive_power", "Voltage", "Global_Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                           colClasses = c("character", "character", rep("numeric",7)), na.strings= "?")
        feb1 <- data[data$Date == "2007-02-01",]
        feb2 <- data[data$Date == "2007-02-02",]
        feb.days <- rbind(feb1, feb2)
}


plot3 <- function(){
        par(mfrow=c(1,1), mar= c(4,4,1,2))
        #make empty plot
        plot(feb.days$datetime, feb.days$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab= "")
        #add points piecewise in respective color
        points(feb.days$datetime, feb.days$Sub_metering_1, col= "black", type="l")
        points(feb.days$datetime, feb.days$Sub_metering_2, col= "red", type="l")
        points(feb.days$datetime, feb.days$Sub_metering_3, col= "blue", type="l")
        #add legend
        legend("topright", legend = names(feb.days[7:9]), col = c("black", "red", "blue"), lty=1) 
        dev.copy(png, file = "plot3.png")
        dev.off()
}
