render.plot2 <- function(data) {
  # Need a continuous range of date/times, but they arrive in separate columns, so
  # glue them together before parsing them
  datetimes <- paste(data$Date, data$Time)
  
  # Now draw the pretty picture.  REMIND: Why can't I use "lines()" here?
  plot(strptime(datetimes, '%d/%m/%Y %H:%M:%S'), data$Global_active_power, type="l", 
       ylab = "Global Active Power (kilowatts)", xlab=NA)
}

create.plot2 <- function(data) {
  png("plot2.png", bg="gray59")
  render.plot2(data)
  dev.off()
}
