
create.plot1 <- function(data) {
  png("plot1.png", bg="gray59")
    hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
    dev.off()
}
