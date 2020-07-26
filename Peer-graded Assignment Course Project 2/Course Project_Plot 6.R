> setwd("~/Desktop") 
> NEI <- readRDS("summarySCC_PM25.rds") 
> SCC <- readRDS("Source_Classification_Code.rds")  
> if(!exists("NEI")){NEI <- readRDS("./data/summarySCC_PM25.rds")} 
> if(!exists("SCC")){SCC <- readRDS("./data/Source_Classification_Code.rds")} 
> if(!exists("NEISCC")){NEISCC <- merge(NEI, SCC, by="SCC")} 
> library(ggplot2) 
> subsetNEI <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",  ] 
> TotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum) 
> TotalByYearAndFips$fips[TotalByYearAndFips$fips=="24510"] <- "Baltimore, MD" 
> TotalByYearAndFips$fips[TotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA" 
> png('Plot6.png') 
> g1 <- ggplot(data=TotalByYearAndFips, mapping=aes(x=factor(year), y=Emissions)) + facet_grid(.~fips) + geom_bar(stat="identity", fill= TotalByYearAndFips$year) + theme_bw(base_family = "Avenir", base_size = 14) + labs(x="year", y=expression("Total PM"[2.5]*"Emissions")) + labs(title="Total Emissions from motor vehicle in Baltimore City vs. Los Angele from 1999 to 2008") 
> print(g1) 
> dev.off() 
