plot1<-function(){
    ## Read data and isolate 2 days.
    dataraw=read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?") #Read the file
    dataraw$Date=as.Date(dataraw$Date, format = "%d/%m/%Y") # Convert first column to "Date"
    data=subset(dataraw, Date == "2007-02-01"|Date=="2007-02-02")     #Isolate only the 2 days of interest
    
    # Create Plot
    png(file = "plot1.png", bg = "transparent")
    
    hist(data$Global_active_power,
         breaks=24,
         col="red",
         xlab = "Global Active Power (kilowatts)",
         main="Global Active Power")
    
    par=(mar=c(1,5,3,7)) 
    dev.off()
    
}