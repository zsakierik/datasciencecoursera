## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
library(ggplot2)

comb <- grepl(" comb", ignore.case = TRUE, SCC$Short.Name )
coal <- grepl(" coal", ignore.case = TRUE, SCC$Short.Name )
coalComb <- (comb & coal)
coalCombSCC <- SCC[coalComb,]$SCC
coalCombNEI <- NEI[NEI$SCC %in% coalCombSCC,]

g <- ggplot(coalCombNEI, aes(factor(year),Emissions/1000,  fill = year))
g + geom_bar(stat="identity") +
  guides(fill=FALSE) +
  labs(x = "Year", y = " PM2.5 emitted (1000 tons)", 
       title = "PM2.5 emissions from coal combustion-related sources" ) 
dev.copy(png, file="plot4.png", height=1000, width=1000)
dev.off()

