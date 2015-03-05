library(sqldf)

#Read only data from the dates 2007-02-01 and 2007-02-02
dataFrame <- read.csv2.sql("household_power_consumption.txt",
                           'SELECT * FROM file WHERE Date IN ("1/2/2007", "2/2/2007")'
                           )

#Create PNG device
png("plot1.png", width = 480, height = 480,  bg = "transparent")

#Draw the histogram to the PNG device
hist(dataFrame$Global_active_power,
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"
     )

#Close PNG device
dev.off()
