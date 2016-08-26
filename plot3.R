#### IMPORTANT ####
#Since github doesn't allow upload of files bigger than 100mb, the data inside the data folder is zipped
#for the code below to work you have to unzip the file.

##Read and Clean the Data
house_pc <- read.csv(file="data/household_power_consumption.txt", header = TRUE, sep=";", na.strings ="?")

#Convert Date and Time to single DateTime variable 
house_pc$DateTime <- as.POSIXct(paste(house_pc$Date, house_pc$Time), format="%d/%m/%Y %H:%M:%S")
house_pc$Date <- as.Date(house_pc$Date, format="%d/%m/%Y")
house_pc$Time <- strptime(house_pc$Time, "%T")

#subset only the days needed
house_pc <- subset(house_pc, Date>="2007-02-01" & Date<="2007-02-02")

##generate PNG plot
#create PNG File
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

#plot
with(house_pc,plot(DateTime,Sub_metering_1,type="n",xlab="", ylab="Energy sub metering"))
lines(house_pc$DateTime,house_pc$Sub_metering_1, col="black")
lines(house_pc$DateTime,house_pc$Sub_metering_2, col="red")
lines(house_pc$DateTime,house_pc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

#close graphics device
dev.off()