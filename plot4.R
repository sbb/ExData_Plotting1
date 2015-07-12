# Prevent plots 2 and 3 from running automatically when loaded.  Crude, but effective
no.auto.run = TRUE
source("plot2.R")
source("plot3.R")
rm(no.auto.run)

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

render.plot4 <- function(data) {
  par(mfcol=c(2,2))
  
  render.plot2(data, ylab = 'Global Active Power')
  render.plot3(data, legend.border = FALSE)
  render.voltage(data)
  render.reactive.power(data)
}

create.plot4 <- function(data = load.and.cache.data()) {
  render.to.png("plot4.png", render.plot4, data)
}

# Generate the plot.  It wasn't clear whether the assignment wanted this to automatically happen
# as a part of loading the script or not, so I chose to make it automatic
create.plot4()