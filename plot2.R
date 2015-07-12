source("common.R")

render.plot2 <- function(data, ylab = "Global Active Power (kilowatts)") {
  plot(data$DateTime, data$Global_active_power, type = "l", 
       ylab = ylab, xlab = NA)
}

create.plot2 <- function(data = load.and.cache.data()) {
  render.to.png("plot2.png", render.plot2, data)
}

# Generate the plot.  It wasn't clear whether the assignment wanted this to automatically happen
# as a part of loading the script or not, so I chose to make it automatic
if (!exists("no.auto.run")) create.plot2()