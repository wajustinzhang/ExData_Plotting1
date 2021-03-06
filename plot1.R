##Read file into data
if(!require("taRifx"))install.packages("taRifx")
library( taRifx )

hpc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")
hpc$Time<-strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")
hpc <- japply( hpc, which(sapply(hpc, class)=="character"), as.numeric )

#filter by date
hpcd<-hpc[hpc$Date >='2007-02-01' & hpc$Date<='2007-02-02',]

#plotting
png(file="plot1.png", width = 480, height = 480)
hist(hpcd$Global_active_power, col="red", xlab="Global_active_power(kilowatt)", main="Global Active Power")
dev.off()
