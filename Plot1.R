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

