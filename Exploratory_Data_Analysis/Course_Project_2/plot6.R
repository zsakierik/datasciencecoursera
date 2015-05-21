## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)

vehicles <- grepl(" vehicles", ignore.case = TRUE, SCC$EI.Sector )
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

vehiclesBaltimore <- subset(vehiclesNEI, fips == '24510')
vehiclesBaltimore$locality <- "Baltimore"

vehiclesLos <- subset(vehiclesNEI, fips == '06037')
vehiclesLos$locality <- "Los Angeles"

localityNEI <- rbind(vehiclesBaltimore,vehiclesLos)

g <- ggplot(localityNEI, aes(factor(year),Emissions,  fill = locality))
g + geom_bar(stat="identity") +
  guides(fill=FALSE) +
  facet_wrap(~ locality) +
  labs(x = "Year", y = " PM2.5 emitted (tons)", 
       title = "PM2.5 emissions from motor vehicle sources in Baltimore City and Los Angeles" ) 
dev.copy(png, file="plot6.png", height=1000, width=1000)
dev.off()

