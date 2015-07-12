source("common.R")

render.plot3 <- function(data, legend.border = TRUE) {
  plot(data$DateTime, data$Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = NA)
  lines(data$DateTime, data$Sub_metering_3,
        ylab = "Energy sub metering", xlab = NA, col = "blue")
  lines(data$DateTime, data$Sub_metering_2,  
        ylab = "Energy sub metering", xlab = NA, col = "red")
  
  legend("topright", lty = 1,  col = c("black", "red", "blue"), 
#         box.col = if (legend.border) par("fg") else NA,
         bty = if (legend.border) "o" else "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3 "))

}
create.plot3<- function(data = load.and.cache.data()) {
  render.to.png("plot3.png", render.plot3, data)
}

# Generate the plot.  It wasn't clear whether the assignment wanted this to automatically happen
# as a part of loading the script or not, so I chose to make it automatic.  Since this script is reused
# by plot4, it conditionally does not create the plot if it's being sourced from plot4.
if (!exists("no.auto.run")) create.plot3()
