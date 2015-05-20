## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission 
##from all sources for each of the years 1999, 2002, 2005, and 2008.
EmissionsByYear <- aggregate(Emissions ~ year, NEI, sum)
plot((EmissionsByYear$Emissions)/1000 ~ EmissionsByYear$year, type = "l", xlab = "Year", ylab = " PM2.5 emitted (1000 tons)", main = "Total emissions from PM2.5 decreased in the United States")
dev.copy(png, file="plot1.png", height=1000, width=1000)
dev.off()