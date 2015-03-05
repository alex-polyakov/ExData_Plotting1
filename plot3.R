library(sqldf)

#Read only data from the dates 2007-02-01 and 2007-02-02
dataFrame <- read.csv2.sql("household_power_consumption.txt",
                           'SELECT * FROM file WHERE Date IN ("1/2/2007", "2/2/2007")'
                           )

#Convert character to Date
dateTime <- with(dataFrame, strptime(paste(Date, Time), "%d/%m/%Y %X"))

#Create PNG device
png("plot3.png", width = 480, height = 480,  bg = "transparent")

#Draw the graph to the PNG device
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
       lty = 1
       )

#Close PNG device
dev.off()
