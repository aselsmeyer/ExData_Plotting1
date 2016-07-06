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

# Create Plot 3
with(powerConsumption, {
        plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering",
             xlab = " ")
        lines(DateTime, Sub_metering_2, col = "red")
        lines(DateTime, Sub_metering_3, col = "blue")
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# Create PNG File
dev.copy(png, file = "plot3.png")
dev.off()