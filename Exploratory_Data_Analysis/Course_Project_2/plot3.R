## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##Which have seen increases in emissions from 1999–2008? 
##Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
EmissionsBaltimore <- subset(NEI, fips == '24510')
g <- ggplot(EmissionsBaltimore, aes(year,Emissions, fill = type))
g + geom_bar(stat="identity") +
  facet_wrap(~ type) +
  guides(fill=FALSE) +
  labs(x = "Year", y = " PM2.5 emitted (1000 tons)", 
       title = "Emissions from PM2.5 decreased in the Baltimore City by Source Type" ) 
dev.copy(png, file="plot3.png", height=1000, width=1000)
dev.off()