# Common factored utility functions.  Each of the plotting scripts loads this
# file so the definitions are available.

PLOT_BACKGROUND_COLOR <- "gray56"

POWER_CONSUMPTION_FILENAME <- "household_power_consumption.txt"

# Loads the power consumption data file using the file referenced by POWER_CONSUMPTION_FILENAME,
# and returns the result.
# This name can be changed in this file above to reflect local conditions if desired.
load.raw.electricity.data <- function() {
  if (!file.exists(POWER_CONSUMPTION_FILENAME)) {
    stop("File not found: ", POWER_CONSUMPTION_FILENAME)
  }
  read.csv(POWER_CONSUMPTION_FILENAME, sep=";", na.strings = "?")
}

# Loads the household power data subset of interest, and returns it.
# If it's already been loaded, just return it immediately, otherwise
# try to load it from the source, add the oh-so-useful DateTime column, which contains
# a POSIXlt/POSIXt entry corresponding to the Date and Time columns of the row, and
# "cache" it in a global variable to avoid loading next time.
#
# The caching behavior can be defeated and read loading forced, by passing TRUE
# in for the "force.loading" parameter.
load.and.cache.data <- function(force.loading = FALSE) {
  # Avoid reloading if we already have the data, unless explicitly directed otherwise.
  if (force.loading | !exists("cached.electricity.data", .GlobalEnv)) {
    raw.data <- load.raw.electricity.data()
    electricity.data <- subset(raw.data, Date == '1/2/2007' | Date == '2/2/2007')
    
    # We will want to use a combined date/time object, so compute it here and
    # tack it on
    electricity.data$DateTime <- with(electricity.data, 
                                      strptime(paste(Date, Time),'%d/%m/%Y %H:%M:%S'))
    
    # Now our data is ready, stick it into a global variable to cache it
    cached.electricity.data <<- electricity.data
  }
  
  cached.electricity.data
}

# Creates a PNG file with the name given by "filename" and causes the function
# referenced by "render.function" to be invoke with the data given by "data", which should
# render the graph into the currently open device (the PNG "device").
#
# Note that "render.function" does not have to be quoted; it can be just the function name.  The
# signature of the rendering function should be "function(data)". It can also be an inline function
# object (again, same signature).
render.to.png <- function(filename, render.function, data) {
  png(filename, bg = PLOT_BACKGROUND_COLOR)
  eval(substitute(render.function))(data)
  dev.off()
}