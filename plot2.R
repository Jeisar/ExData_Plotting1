plot2<-function(){
    ## Read data and isolate 2 days.
    dataraw=read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?") #Read the file
    dataraw$Date=as.Date(dataraw$Date, format = "%d/%m/%Y") # Convert first column to "Date"
    data=subset(dataraw, Date == "2007-02-01"|Date=="2007-02-02")     #Isolate only the 2 days of interest
    
    ## Create new Date&Time column to sort
    data$DateTime = as.POSIXct(paste(as.character(data$Date),as.character(data$Time)))
    
    ## Create Plot
    png(file = "plot2.png", bg = "transparent")
    
    plot(data$DateTime,data$Global_active_power, 
         type = "l", 
         xlab = "", 
         ylab = "Global Active Power (kilowatts)" , 
         bg = "transparent") # Create empty plot

    par=(mar=c(1,5,3,7) ) # Set the margins
    dev.off()
    
}