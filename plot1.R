source("downloadArchive.R")

# Load the NEI & SCC data frames.
## Patience my young padawan, this first line will likely take a few seconds.
if(!exists("NEI")){
        NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("Source_Classification_Code.rds")
}

# Aggregate by sum the total emissions by year
AggTotalsByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=AggTotalsByYear$Emissions, 
        names.arg=AggTotalsByYear, 
        xlab="years", 
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions at various years'))

png("plot1.png",width=480,height=480,units="px",bg="transparent", col="red")
barplot((AggTotalsByYear$Emissions)/10^6,
        names.arg=AggTotalsByYear$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All US Sources")

dev.off()

