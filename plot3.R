render.plot3 <- function(data) {
  # Need a continuous range of date/times, but they arrive in separate columns, so
  # glue them together before parsing them
  datetimes <- paste(data$Date, data$Time)
  
  # Now draw the pretty picture.
  plot(strptime(datetimes, '%d/%m/%Y %H:%M:%S'), data$Sub_metering_1, type="l", 
        ylab = "Energy sub metering", xlab=NA)
  lines(strptime(datetimes, '%d/%m/%Y %H:%M:%S'), data$Sub_metering_3, type="l", 
       ylab = "Energy sub metering", xlab=NA, col="blue")
  lines(strptime(datetimes, '%d/%m/%Y %H:%M:%S'), data$Sub_metering_2, type="l", 
       ylab = "Energy sub metering", xlab=NA, col="red")
  
  legend("topright", lty=1,  col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3 "))

}
create.plot3<- function(data) {
  png("plot3.png", bg="gray59")
  render.plot3(data)
  dev.off()
}
