#1 Calculating the Cumulative Air Dose Rate
#2 Establish the region
#3 Calculate the CED
#4 Make percentages of Region, Population and CED
library(leaflet)
library(dplyr)
library(ggplot2)
nukeicon <- makeIcon(iconUrl = "npp.png",iconWidth = 20, iconHeight=20)
#TEPCO
# Detailed Monitoring in the Restricted Area and Planned Evacuation Zone 
# (1st Vehicle-borne Survey) ( August 2014 )
# http://emdb.jaea.go.jp/emdb/en/portals/b133/
air_2014 <- read.csv(file = "10200000002_07.csv", header = TRUE)
names(air_2014) <- c("gridcode","sdate","edate","pref","city","no_samples","AvgAirDoseRate",
                     "NE_nLat","NE_eLong","NW_nLat","NW_eLong",
                     "SW_nLat","SW_eLong","SE_nLat","SE_eLong")
air_2014$AnnualExtDose <- (air_2014$AvgAirDoseRate - 0.04)*(16 + 8*0.4)*365/1000
air_2014$sdate <- as.Date(air_2014$sdate,"%Y-%m-%d")
air_2014$edate <- as.Date(air_2014$edate,"%Y-%m-%d")
air_2014$pref <- as.character(air_2014$pref)
air_2014$city <- as.character(air_2014$city)
air_2014$gridcode <- as.character(air_2014$gridcode)
#make cuts of Annual External Air Dose
air_2014$AnnualDoseRange <- cut(air_2014$AnnualExtDose, c(0,1,5,10,20,50,100,250,850))
#calculate area
areakm2 <- as.data.frame(table(air_2014$AnnualDoseRange))
areakm2$Var1 <- areakm2$AnnualDoseRange

iro2 <- colorFactor(
        palette = "PuRd",
        domain = air_2014$AnnualDoseRange)
air_2014_plot <- leaflet() %>%
        addTiles()%>%
        addRectangles(data = air_2014,lng1 = ~SW_eLong, lat1 = ~SW_nLat,
                      lng2 = ~NE_eLong, lat2 = ~NE_nLat,
                      color = ~iro2(air_2014$AnnualDoseRange))%>%
        addLegend("bottomright", pal = iro2, values = air_2014$AnnualDoseRange,
                  title = "2014 CEDmSv/y",
                  opacity = 1)%>%
        addMarkers(lat = 37.4211, lng = 141.0328,icon = nukeicon)
air_2014_plot






#Readings of Detailed Monitoring in the Restricted Area and Planned Evacuation Zone 
# (6th Vehicle-borne Survey) ( From Feburary 2013 to March 2013 )
air_2012 <- read.csv(file = "10200000007_07.csv", header = TRUE)
names(air_2012) <- c("gridcode","sdate","edate","pref","city","no_samples","AvgAirDoseRate",
                     "NE_nLat","NE_eLong","NW_nLat","NW_eLong",
                     "SW_nLat","SW_eLong","SE_nLat","SE_eLong")
air_2012$AnnualExtDose <- (air_2012$AvgAirDoseRate - 0.04)*(16 + 8*0.4)*365/1000
air_2012$sdate <- as.Date(air_2012$sdate,"%Y-%m-%d")
air_2012$edate <- as.Date(air_2012$edate,"%Y-%m-%d")
air_2012$pref <- as.character(air_2012$pref)
air_2012$city <- as.character(air_2012$city)
air_2012$gridcode <- as.character(air_2012$gridcode)
#make cuts of Annual External Air Dose
air_2012$AnnualDoseRange <- cut(air_2012$AnnualExtDose, c(0,1,5,10,20,50,100,250,850))
#calculate area
areakm2 <- as.data.frame(table(air_2012$AnnualDoseRange))
areakm2$Var1 <- areakm2$AnnualDoseRange

iro2 <- colorFactor(
        palette = "PuRd",
        domain = air_2012$AnnualDoseRange)
air_2012_plot <- leaflet() %>%
        addTiles()%>%
        addRectangles(data = air_2012,lng1 = ~SW_eLong, lat1 = ~SW_nLat,
                      lng2 = ~NE_eLong, lat2 = ~NE_nLat,
                      color = ~iro2(air_2012$AnnualDoseRange))%>%
        addLegend("bottomright", pal = iro2, values = air_2012$AnnualDoseRange,
                  title = "2012 CEDmSv/y",
                  opacity = 1)%>%
        addMarkers(lat = 37.4211, lng = 141.0328,icon = nukeicon)
air_2012_plot

# Readings of Detailed Monitoring in the Restricted Area and Planned Evacuation Zone 
# (13th Vehicle-borne Survey) ( From March 2013 to April 2013 )
air_2013 <- read.csv(file = "10200000014_07.csv", header = TRUE)
names(air_2013) <- c("gridcode","sdate","edate","pref","city","no_samples","AvgAirDoseRate",
                     "NE_nLat","NE_eLong","NW_nLat","NW_eLong",
                     "SW_nLat","SW_eLong","SE_nLat","SE_eLong")
air_2013$AnnualExtDose <- (air_2013$AvgAirDoseRate - 0.04)*(16 + 8*0.4)*365/1000
air_2013$sdate <- as.Date(air_2013$sdate,"%Y-%m-%d")
air_2013$edate <- as.Date(air_2013$edate,"%Y-%m-%d")
air_2013$pref <- as.character(air_2013$pref)
air_2013$city <- as.character(air_2013$city)
air_2013$gridcode <- as.character(air_2013$gridcode)
#make cuts of Annual External Air Dose
air_2013$AnnualDoseRange <- cut(air_2013$AnnualExtDose, c(0,1,5,10,20,50,100,250,850))
#calculate area
areakm2 <- as.data.frame(table(air_2013$AnnualDoseRange))
areakm2$Var1 <- areakm2$AnnualDoseRange

iro2 <- colorFactor(
        palette = "PuRd",
        domain = air_2013$AnnualDoseRange)
air_2013_plot <- leaflet() %>%
        addTiles()%>%
        addRectangles(data = air_2013,lng1 = ~SW_eLong, lat1 = ~SW_nLat,
                      lng2 = ~NE_eLong, lat2 = ~NE_nLat,
                      color = ~iro2(air_2013$AnnualDoseRange))%>%
        addLegend("bottomright", pal = iro2, values = air_2013$AnnualDoseRange,
                  title = "2013 CEDmSv/y",
                  opacity = 1)%>%
        addMarkers(lat = 37.4211, lng = 141.0328,icon = nukeicon)
air_2013_plot






#  Readings of Detailed Monitoring in the Areas to Which Evacuation Orders Have Been Issued 
# (17th Vehicle-borne Survey) ( From March 2014 to April 2014 )
air_2014 <- read.csv(file = "10202600017_07.csv", header = TRUE)
names(air_2014) <- c("gridcode","sdate","edate","pref","city","no_samples","AvgAirDoseRate",
                     "NE_nLat","NE_eLong","NW_nLat","NW_eLong",
                     "SW_nLat","SW_eLong","SE_nLat","SE_eLong")
air_2014$AnnualExtDose <- (air_2014$AvgAirDoseRate - 0.04)*(16 + 8*0.4)*365/1000
air_2014$sdate <- as.Date(air_2014$sdate,"%Y-%m-%d")
air_2014$edate <- as.Date(air_2014$edate,"%Y-%m-%d")
air_2014$pref <- as.character(air_2014$pref)
air_2014$city <- as.character(air_2014$city)
air_2014$gridcode <- as.character(air_2014$gridcode)
#make cuts of Annual External Air Dose
air_2014$AnnualDoseRange <- cut(air_2014$AnnualExtDose, c(0,1,5,10,20,50,100,250,850))
#calculate area
areakm2 <- as.data.frame(table(air_2014$AnnualDoseRange))
areakm2$Var1 <- areakm2$AnnualDoseRange

iro2 <- colorFactor(
        palette = "PuRd",
        domain = air_2014$AnnualDoseRange)
air_2014_plot <- leaflet() %>%
        addTiles()%>%
        addRectangles(data = air_2014,lng1 = ~SW_eLong, lat1 = ~SW_nLat,
                      lng2 = ~NE_eLong, lat2 = ~NE_nLat,
                      color = ~iro2(air_2014$AnnualDoseRange))%>%
        addLegend("bottomright", pal = iro2, values = air_2014$AnnualDoseRange,
                  title = "2014 CEDmSv/y",
                  opacity = 1)%>%
        addMarkers(lat = 37.4211, lng = 141.0328,icon = nukeicon)
air_2014_plot









#MinSci
# March 2015, Air Dose Rates Measured by Route Buses in Fukushima Prefecture
# http://emdb.jaea.go.jp/emdb/en/portals/b147/
air_2015 <- read.csv(file = "./MinSci/10214700026_00_201503/10214700026_00_20150329.csv", header = TRUE)

