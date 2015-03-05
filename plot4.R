library(sqldf)

#Read only data from the dates 2007-02-01 and 2007-02-02
dataFrame <- read.csv2.sql("household_power_consumption.txt",
                           'SELECT * FROM file WHERE Date IN ("1/2/2007", "2/2/2007")'
                           )

#Convert character to Date
dateTime <- with(dataFrame, strptime(paste(Date, Time), "%d/%m/%Y %X"))

#Create PNG device
png("plot4.png", width = 480, height = 480,  bg = "transparent")

#Draw the graphs to the PNG device
#Create a field for 4 graphs
par(mfrow = c(2, 2))

# 1) Top-left
plot(dateTime,
     dataFrame$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power"
     )

# 2) Top-right
plot(dateTime,
     dataFrame$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage"
     )

# 3) Bottom-left
plot(dateTime, 
     dataFrame$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering"
     )
lines(dateTime,
      dataFrame$Sub_metering_2,
      col = "Red"
      )
lines(dateTime,
      dataFrame$Sub_metering_3,
      col = "Blue"
      )

legend(x="topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("Black","Red","Blue"),
       lty = 1,
       bty = "n"
       )

# 4) Bottom-right
plot(dateTime,
     dataFrame$Global_reactive_power,
     type = "l",
     col = "black",
     xlab = "datetime",
     ylab = "Global_reactive_power"
     )

#Close PNG device
dev.off()
