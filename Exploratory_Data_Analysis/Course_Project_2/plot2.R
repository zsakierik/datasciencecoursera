## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.
EmissionsBaltimore <- subset(NEI, fips == '24510')
EmissionsBaltimoreByYear <- aggregate(Emissions ~ year, EmissionsBaltimore, sum)
plot((EmissionsBaltimoreByYear$Emissions)/1000 ~ EmissionsBaltimoreByYear$year, 
     type = "l", xlab = "Year", ylab = " PM2.5 emitted (1000 tons)", 
     main = "Total emissions from PM2.5 decreased in the Baltimore City")
dev.copy(png, file="plot2.png", height=1000, width=1000)
dev.off()