# Exploratory Data Analysis
## Course Project 1
### Graphing sample data

Dear reviewer,

As per the project description, I have included 4 .png files (plots 1 through 4), and the 4 R scripts that
create them.  

The scripts will (re-)generate the corresponding png files when loaded into R.  You need not invoke anything explicitly.  Since there were png artifacts included in the repo, I chose to match those (including the transparent background), figuring they were more authoritative.  You can easily change the background color of all of them by changing the `PLOT_BACKGROUND_COLOR` variable in `common.R` to the color of your choice and reload the various plot scripts to regenerate the png files.

Your working directory should be set to the directory containing these files before loading them into R.

I elected not to include the base dataset into Git, as it was rather large.  Instead, please copy the unzipped `household_power_consumption.txt` that you have already downloaded into this directory.  Or, you may change the `POWER_CONSUMPTION_FILENAME` variable definition in `common.R` to point to your copy.

The data in this assignment originated from: 

https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
    
and contains measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years.

I tried to factor and reuse the code where I could.  I hope my techniques are not too obscure; I have tried to explain what I am doing in comments as appropriate.

Thank you for reading this, and I hope you enjoy looking at my code.  Please do not hesitate to let me know if there are ways I could have done things better.  In particular, I would like advice on how to read just a subset of the data instead of reading the entire dataset into memory and then subsetting it (I automatically memoize the data subset when it's first needed, so only one of running plots 1 through 4 will have to load in the full dataset).  I would also like to know if is a standard R idiom for the `if $PROGRAM_NAME == __FILE__` trick that Ruby uses to selectively invoke code if the current file is the top level file and is not being included by another one (such as running actual plotting functions, as opposed to just defining them); I have a bit of what I consider a suboptimal solution to prevent plots 2 and 3 from being run again when they are loaded as part of plot 4.