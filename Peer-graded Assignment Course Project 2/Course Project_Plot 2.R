> setwd("~/Desktop")
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds") 
> if(!exists("NEI")){NEI <- readRDS("./data/summarySCC_PM25.rds")} 
> if(!exists("SCC")){SCC <- readRDS("./data/Source_Classification_Code.rds")} 
> subsetNEI  <- NEI[NEI$fips=="24510", ] 
> aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum) 
> png('Plot2.png') 
> barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="Years", ylab=expression('Total PM'[2.5]*' emission'),main=expression('Emissions at various years')) 
> dev.off() 