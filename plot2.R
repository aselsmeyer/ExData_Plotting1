setInternet2(TRUE)

# Download the data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "household_power_consumption.zip")
download.file(fileURL, f, method = "curl")

dateDownloaded <- date()

# Unzip the file
unzip(f, exdir = ".")

# Read the dataset

powerConsumptionFull <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

powerConsumption <- powerConsumptionFull[(powerConsumptionFull$Date == "1/2/2007" | powerConsumptionFull$Date == "2/2/2007"), ]

# Convert Date and Time Variables
powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")

dateTime <- paste(powerConsumption$Date, powerConsumption$Time)

powerConsumption$DateTime <- as.POSIXct(dateTime)

# Create Plot 2
plot(powerConsumption$Global_active_power~powerConsumption$DateTime, 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")

# Create PNG File
dev.copy(png, file = "plot2.png")
dev.off()
     