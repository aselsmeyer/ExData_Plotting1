setInternet2(TRUE)

# Download the data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "household_power_consumption.zip")
download.file(fileURL, f, method = "curl")

dateDownloaded <- date()

# Unzip the file
temp <- unzip(f)
files <- list.files(getwd())
file <- paste(f)

# Read the dataset

powerConsumption <- read.table("household_power_consumption.txt")
#powerConsumption <- subset(powerConsumption, Date == (01/02/2007 : 02/02/2007))