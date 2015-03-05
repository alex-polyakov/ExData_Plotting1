library(sqldf)

#Read only data from the dates 2007-02-01 and 2007-02-02
dataFrame <- read.csv2.sql("household_power_consumption.txt",
                           'SELECT * FROM file WHERE Date IN ("1/2/2007", "2/2/2007")'
                           )

#Convert character to Date
dateTime <- with(dataFrame, strptime(paste(Date, Time), "%d/%m/%Y %X"))

#Create PNG device
png("plot2.png", width = 480, height = 480,  bg = "transparent")

#Draw the graph to the PNG device
plot(dateTime,
     dataFrame$Global_active_power, 
     type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)"
     )

#Close PNG device
dev.off()
