
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

## Name the file as plot1.png and set the height and width
png("plot1.png",height = 480, width = 480)

## use the hist function to draw the histogram. Convert the Global Active Power data to numeric. Change the color to red
hist(as.numeric(subsetData$Global_active_power), main = "Global Active Power", xlab = "Global Active Power(kilowatts)",col= "Red")

dev.off()