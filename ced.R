#1 Calculating the Cumulative Air Dose Rate
#2 Establish the region
#3 Calculate the CED
#4 Make percentages of Region, Population and CED

library(dplyr)
library(ggplot2)
library(leaflet)
#TEPCO
# Detailed Monitoring in the Restricted Area and Planned Evacuation Zone 
# (1st Vehicle-borne Survey) ( August 2011 )
# http://emdb.jaea.go.jp/emdb/en/portals/b133/
air_2011 <- read.csv(file = "../CED/10200000002_07.csv", header = TRUE)
dim(air_2011)
View(air_2011)
names(air_2011) <- c("gridcode","sdate","edate","pref","city","no_samples","AvgAirDoseRate",
                     "NE_nLat","NE_eLong","NW_nLat","NW_eLong",
                     "SW_nLat","SW_eLong","SE_nLat","SE_eLong")
air_2011 <- read.csv("air_2011.csv")

air_2011$AnnualExtDose <- (air_2011$AvgAirDoseRate - 0.04)*(8 + 16*0.4)*365/1000
air_2011$sdate <- as.Date(air_2011$sdate,"%Y-%m-%d")
air_2011$edate <- as.Date(air_2011$edate,"%Y-%m-%d")
air_2011$pref <- as.character(air_2011$pref)
air_2011$city <- as.character(air_2011$city)
air_2011$gridcode <- as.character(air_2011$gridcode)
#make cuts of Annual External Air Dose
air_2011$AnnualExDoseRange <- cut(air_2011$AnnualExtDose, c(0,1,5,10,20,50,100,250,850))
#calculate area
areakm2 <- as.data.frame(table(air_2011$AnnualDoseRange))
areakm2$Var1 <- areakm2$AnnualDoseRange

iro <- colorFactor(
        palette = "",
        domain = air_2011$pop_quants
)

iro2 <- colorFactor(
        palette = "PuRd",
        domain = air_2011$AnnualDoseRange
)
air_2011_plot <- leaflet() %>%
        addTiles()%>%
        addRectangles(data = air_2011,lng1 = ~SW_eLong, lat1 = ~SW_nLat,
                      lng2 = ~NE_eLong, lat2 = ~NE_nLat,
                      color = ~iro2(air_2011$AnnualDoseRange))
air_2011_plot
#Readings of Detailed Monitoring in the Restricted Area and Planned Evacuation Zone 
# (6th Vehicle-borne Survey) ( From Feburary 2012 to March 2012 )
air_2012 <- read.csv(file = "10200000007_07.csv", header = TRUE)
names(air_2012) <- c("gridcode","sdate","edate","pref","city","no_samples","AvgAirDoseRate",
                     "NE_nLat","NE_eLong","NW_nLat","NW_eLong",
                     "SW_nLat","SW_eLong","SE_nLat","SE_eLong")
write.csv(air_2012,file = "air_2012.csv")
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
View(air_2015)


#### GGPLOT2, Combining Towns and Air Dose datasets
p <- ggplot() +
        geom_point(data = air_2011, aes(x=SW_eLong,y=SW_nLat),size=5,color="grey50")+
        
        geom_polygon(data=fu_f,aes(x = long, y = lat, group = group),color="#999999",fill=NA)+
        coord_map()+
        annotate("text", x = 141.0328, y = 37.4211, label = "x",color="red", size=4)+
        ggtitle("Year 2011") +
        theme(axis.line=element_blank(),
              axis.text.x=element_blank(),
              axis.text.y=element_blank(),
              axis.ticks=element_blank(),
              axis.title.x=element_blank(),
              axis.title.y=element_blank(),
              panel.background=element_blank(),
              panel.border=element_blank(),
              panel.grid.major=element_blank(),
              panel.grid.minor=element_blank(),
              plot.background=element_blank())
p 
+ facet_grid(~ month)

