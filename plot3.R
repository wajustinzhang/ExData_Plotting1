##Read file into data
if(!require("taRifx"))install.packages("taRifx")
library( taRifx )

hpc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")
hpc$Time<-strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")
hpc <- japply( hpc, which(sapply(hpc, class)=="character"), as.numeric )

# filter by date
hpcd<-hpc[hpc$Date >='2007-02-01' & hpc$Date<='2007-02-02',]

# Plotting
png(file="plot3.png", width = 480, height = 480)
ranges<-range(0, hpcd$Sub_metering_1,hpcd$Sub_metering_1,hpcd$Sub_metering_1)
plot(hpcd$Time, hpcd$Sub_metering_1, type="l", ylim=ranges, col="grey", xlab="", ylab="Energy Sub Metering")
lines(hpcd$Time, hpcd$Sub_metering_2, type="l", ylim=ranges, col="red")
lines(hpcd$Time, hpcd$Sub_metering_3, type="l", ylim=ranges, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("gray","red","blue"), lty=1:2)
dev.off()