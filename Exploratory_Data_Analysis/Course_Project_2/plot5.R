## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)

vehicles <- grepl(" vehicles", ignore.case = TRUE, SCC$EI.Sector )
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
vehiclesBaltimore <- subset(vehiclesNEI, fips == '24510')

g <- ggplot(vehiclesBaltimore, aes(factor(year),Emissions,  fill = year))
g + geom_bar(stat="identity") +
  guides(fill=FALSE) +
  labs(x = "Year", y = " PM2.5 emitted (tons)", 
       title = "PM2.5 emissions from motor vehicle sources in Baltimore City" ) 
dev.copy(png, file="plot5.png", height=1000, width=1000)
dev.off()

