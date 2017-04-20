##Read file into data
if(!require("taRifx"))install.packages("taRifx")
library( taRifx )

hpc<-read.table("hpc.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")
hpc$Time<-strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")
hpc <- japply( hpc, which(sapply(hpc, class)=="character"), as.numeric )

# filter by date
hpcd<-hpc[hpc$Date >='2007-02-01' & hpc$Date<='2007-02-02',]

# Plotting
par(mfrow=c(2,2))
#First plot
plot(hpcd$Time ,hpcd$Global_active_power, type="l", xlab="", ylab="Global_active_power")
#Second plot
plot(hpcd$Time ,hpcd$Voltage, type="l", xlab="DateTime", ylab="Voltage")
#Third plot
ranges<-range(0, hpcd$Sub_metering_1,hpcd$Sub_metering_1,hpcd$Sub_metering_1)
plot(hpcd$Time, hpcd$Sub_metering_1, type="l", ylim=ranges, col="grey", xlab="", ylab="Energy Sub Metering")
lines(hpcd$Time, hpcd$Sub_metering_2, type="l", ylim=ranges, col="red")
lines(hpcd$Time, hpcd$Sub_metering_3, type="l", ylim=ranges, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("gray","red","blue"), lty=1:2)

plot(hpcd$Time ,hpcd$Global_reactive_power, type="l", xlab="DateTime", ylab="Voltage")
