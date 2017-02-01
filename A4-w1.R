

##Data Loading and Processing 

install.packages("data.table")
library(dplyr)

setwd("C:/Users/lsharifi/Desktop/Rot2/coursera/A4-w1")

power<- read.table ('household_power_consumption.txt', sep=";" , header=TRUE, na.strings="?",
      stringsAsFactors=FALSE 
)

View(power)

#convert date and time variables to Date/Time class

power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

power$Date <- as.Date(power$Date, "%d/%m/%Y") 

# We will only be using data from the dates 2007-02-01 and 2007-02-02

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d") 
power <- subset(power, Date %in% dates) 
power

--------------------------------------------------------------Plot1------------------------------------------------
  
  plot1 <- hist(power$Global_active_power, main = paste("Global Active Power"), col="red", ylab="Frequency" , xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


--------------------------------------------------------------Plot2------------------------------------------------
  
  plot2<- plot(power$Time,power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

--------------------------------------------------------------Plot3------------------------------------------------
  
  
  plot3 <-  plot(power$Time,power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$Time,power$Sub_metering_2,col="red")
lines(power$Time,power$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()


-------------------------------------------------------------Plot4----------------------------------------------------
  
  plot4 <- 
  par(mfrow=c(2,2))

##PLOT 1
plot(power$Time,power$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##PLOT 2
plot(power$Time,power$Voltage, type="l", xlab="datetime", ylab="Voltage")

##PLOT 3
plot(power$Time,power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$Time,power$Sub_metering_2,col="red")
lines(power$Time,power$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

#PLOT 4
plot(power$Time,power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#OUTPUT
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

  

      
  
  





