### plot1.R

# reading file. (Plz note: folder "ExData_Plotting1" must be in working directory)
dfData <- read.table("ExData_Plotting1\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                     header = TRUE, sep=";")

# format the date 
dfData$Date <- as.Date(dfData$Date, format="%d/%m/%Y")

# subset data 
dfDataSubset <- subset(dfData, Date == "2007-02-01" | Date == "2007-02-02")

# plot the graph
hist(as.numeric(as.character(dfDataSubset$Global_active_power)), col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# save the graph in png file
dev.copy(png, file="ExData_Plotting1\\plot1.png", width=480, height=480)
dev.off()