plot3<-function(){
    ## Read data and isolate 2 days.
    dataraw=read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?") #Read the file
    dataraw$Date=as.Date(dataraw$Date, format = "%d/%m/%Y") # Convert first column to "Date"
    data=subset(dataraw, Date == "2007-02-01"|Date=="2007-02-02")     #Isolate only the 2 days of interest
    
    ## Create new Date&Time column to sort
    data$DateTime = as.POSIXct(paste(as.character(data$Date),as.character(data$Time)))
    
    ## Create Plot
    png(file = "plot3.png", bg = "transparent")
    
    plot(data$DateTime,data$Sub_metering_1, 
         type = "n", 
         xlab = "", 
         ylab = "Energy sub metering" , 
         bg = "transparent",
         cex=0.75) # Create empty plot
    
    lines(data$DateTime,data$Sub_metering_1) # Draw line 1
    lines(data$DateTime,data$Sub_metering_2, col="red") # Draw line 2
    lines(data$DateTime,data$Sub_metering_3, col="blue") # Draw line 3
    
    par=(mar=c(1,5,3,7) ) # Set the margins
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=c(1, 1, 1), cex=1) # Create the legend
    dev.off()
    
}

