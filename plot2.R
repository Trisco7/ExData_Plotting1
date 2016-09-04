### plot2.R

# reading file. (Plz note: folder "ExData_Plotting1" must be in working directory)
# can run on console as source("ExData_Plotting1\\plot2.R")
dfData <- read.table("ExData_Plotting1\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                     header = TRUE, sep=";")

# format the date 
dfData$Date <- as.Date(dfData$Date, format="%d/%m/%Y")

# subset data 
dfDataSubset <- subset(dfData, Date == "2007-02-01" | Date == "2007-02-02")

# preprocess data acc. to the graph to be plotted
dfDataSubset$DateTime <- paste(dfDataSubset$Date, dfDataSubset$Time, sep=" ")
# just to be sure that data arranged in order
dfDataSubset <- dfDataSubset[order(dfDataSubset$DateTime), ]
# prepare labels and tick points for x-axis
chvWeekdays <- format(strptime(dfDataSubset$DateTime,  "%Y-%m-%d %H:%M:%S"), "%a")
chvXLabels <- c(unique(chvWeekdays), format(strptime("2007-02-03", "%Y-%m-%d"), "%a"))
nvXTicks <- c(1, grep("2007-02-02 00:00:00", dfDataSubset$DateTime), nrow(dfDataSubset)+1)

# plot the graph
plot(as.factor(dfDataSubset$DateTime), as.numeric(as.character(dfDataSubset$Global_active_power)), 
     ylab="Global Active Power (kilowatts)", type="n", xaxt="n")
lines(as.factor(dfDataSubset$DateTime), as.numeric(as.character(dfDataSubset$Global_active_power)), type="l")
axis(1, at=nvXTicks, labels=chvXLabels)

# save the graph in png file
dev.copy(png, file="ExData_Plotting1\\plot2.png", width=480, height=480)
dev.off()