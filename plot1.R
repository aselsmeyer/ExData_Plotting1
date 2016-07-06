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

# Create Plot 1
hist(powerConsumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Create PNG File
dev.copy(png, file = "plot1.png")
dev.off()