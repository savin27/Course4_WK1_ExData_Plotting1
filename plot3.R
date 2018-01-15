
## get the current directory
getwd()

## set the directory
setwd("F:/R/exdata_data_household_power_consumption/")

## store the file in datafile
datafile <- "./household_power_consumption.txt"

## read the data file 
data <- read.table(datafile, header=T, sep=";",stringsAsFactors=F)

## CHange the date format to yyyy-mm-dd
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Get the subset of data for the dates 02/01/2007 and 02/02/2007
subsetData <- subset(data,subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert Date and time
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

##Convert data to numeric
GlobalActivePower <- as.numeric(subsetData$Global_active_power)
SubMetering1 <- as.numeric(subsetData$Sub_metering_1)
SubMetering2 <- as.numeric(subsetData$Sub_metering_2)
SubMetering3 <- as.numeric(subsetData$Sub_metering_3)

## Name the file as plot3.png and set the height and width
png("plot3.png",height = 480, width = 480)

## plotting
plot(datetime, SubMetering1, type="l", xlab = "", ylab = "Energy Submetering")

#Add submetering2 to the plot
lines(datetime, SubMetering2, type="l", col = "red")

#Add submetering3 to the plot
lines(datetime, SubMetering3, type="l", col = "blue")

##legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


dev.off()