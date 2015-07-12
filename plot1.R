source("common.R")

render.plot1 <- function(data) {
  hist(data$Global_active_power, main = "Global Active Power", 
       col = "red", xlab = "Global Active Power (kilowatts)") 
}

create.plot1 <- function(data = load.and.cache.data()) {
  render.to.png("plot1.png", render.plot1, data)
}

# Generate the plot.  It wasn't clear whether the assignment wanted this to automatically happen
# as a part of loading the script or not, so I chose to make it automatic
if (!exists("no.auto.run")) create.plot1()
