#1 Calculating the Cumulative Air Dose Rate
#2 Establish the region
#3 Calculate the CED
#4 Make percentages of Region, Population and CED

library(dplyr)
library(ggplot2)
#TEPCO
# Detailed Monitoring in the Restricted Area and Planned Evacuation Zone 
# (1st Vehicle-borne Survey) ( August 2011 )
# http://emdb.jaea.go.jp/emdb/en/portals/b133/
air_2011 <- read.csv(file = "10200000002_07.csv", header = TRUE)
dim(air_2011)
#Readings of Detailed Monitoring in the Restricted Area and Planned Evacuation Zone 
# (6th Vehicle-borne Survey) ( From Feburary 2012 to March 2012 )
air_2012 <- read.csv(file = "10200000007_07.csv", header = TRUE)
dim(air_2012)

# Readings of Detailed Monitoring in the Restricted Area and Planned Evacuation Zone 
# (13th Vehicle-borne Survey) ( From March 2013 to April 2013 )
air_2013 <- read.csv(file = "10200000014_07.csv", header = TRUE)
dim(air_2013)

#  Readings of Detailed Monitoring in the Areas to Which Evacuation Orders Have Been Issued 
# (17th Vehicle-borne Survey) ( From March 2014 to April 2014 )
air_2014 <- read.csv(file = "10202600017_07.csv", header = TRUE)
dim(air_2014)

#MinSci
# March 2015, Air Dose Rates Measured by Route Buses in Fukushima Prefecture
# http://emdb.jaea.go.jp/emdb/en/portals/b147/
air_2015 <- read.csv(file = "./MinSci/10214700026_00_201503/10214700026_00_20150329.csv", header = TRUE)
dim(air_2015)

