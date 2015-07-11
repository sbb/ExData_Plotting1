source("plot2.R")
source("plot3.R")

render.voltage <- function(data) {
  # Need a continuous range of date/times, but they arrive in separate columns, so
  # glue them together before parsing them
  datetimes <- paste(data$Date, data$Time)
  
  # Now draw the pretty picture.  REMIND: Why can't I use "lines()" here?
  plot(strptime(datetimes, '%d/%m/%Y %H:%M:%S'), data$Voltage, type="l", 
       ylab = "Voltage", xlab="datetime")
}

render.reactive.power <- function(data) {
  # Need a continuous range of date/times, but they arrive in separate columns, so
  # glue them together before parsing them
  datetimes <- paste(data$Date, data$Time)
  
  # Now draw the pretty picture.  REMIND: Why can't I use "lines()" here?
  with(data, plot(strptime(datetimes, '%d/%m/%Y %H:%M:%S'), Global_reactive_power, type="l", 
      xlab="datetime"))
}

create.plot4 <- function(data) {
  png("plot4.png", bg="gray59")
  par(mfcol=c(2,2))
  
  render.plot2(data)
  render.plot3(data)
  render.voltage(data)
  render.reactive.power(data)
  
  dev.off()
}