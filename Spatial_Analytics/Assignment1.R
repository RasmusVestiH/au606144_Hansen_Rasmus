# Welcome! The first section of the R file is dedicated to the first two questions and the actual 
# code for the assignment is below. 

#Question 1: Describe a problem or question in your field for which spatial analysis could be applicable.
# - It could be interesting to work further on the project we created last semester in 'Introduction to CDS'. 
# In this project we analyzed abortion and average income in different danish municipalities. By introducing 
# spatial mapping of the data it would give more depth to the case as it could be seen areas as a whole but 
# divided in the municipalities. 
# 
# Question 2: List 5 data layers that you think are necessary to answer your question/solve your problem. 
# Find on the internet github.and then describe examples of two or three of your listed layers.
# - Not sure what is meant with 5 data layers that are "necessary" for the question? But I have however read 
# this article: "https://dna.firstam.com/insights-blog/the-5-layers-of-gis-mapping-what-they-are-and-how-they-work"
# in which is described how there are 5 layers of understanding GIS, which can be helpful. As mentioned in 
# this the first step is gathering information to work with. This would then be coordinates for the danish 
# municipalities that we would find for our case. This would probably be best as polygons data of the municipalities, I think.
# From there on it would be working the data of our final project which was datasets and sort the municipalities
# in a way that lets it get integrated in the mapping.   
#   
#   
# Question 3:  
# Code: Your colleague has found some ruins during a hike in the Blue Mountains and recorded the coordinates 
# of structures on her phone(RCFeature.csv). She would like to map her points but has no computer or mapping skills. 
# Can you make a map that she can work with using only a browser? She needs an interactive map that she can 
# download to her computer and use straightaway.
# 
# Create a standalone .html map in Leaflet showing at least basic topography and relief, and load in the 
# table of points. Make sure she can see the FeatureID, FeatureType and Description attributes when she hovers over 
# the point markers. 
# 
# Consider adding elements such as minimap() and measure() for easier map interaction
# Explore differentiating the markers (e.g. by size using Accuracy field)
# Explore the option of clustering markers with addMarkers(clusterOptions = markerClusterOptions()). 
# Do you recommend marker clustering here?
  
  
library(tidyverse)
library(leaflet)
library(htmlwidgets)
library(htmltools)

RCdata <- read.csv(file = "Desktop/RCFeature.csv") 
#Firstly we read the csv file which has been downloaded to the desktop
#Then we save the map as "m" and make the map with the leaflet tool
m <- leaflet() %>% 
      addTiles() %>% #Using the default tiles for the map
      addMarkers(lng = RCdata$Longitude,
                 lat = RCdata$Latitude, #Using the longitude and latitude rows as sources for the coordinates
                 label = paste("Description:", RCdata$Description, "|", #By creating a label it will give a hover effect in use
                           "ID:", RCdata$FeatureID, "|", 
                           "Type:", RCdata$FeatureType)) %>% 
  addProviderTiles("Esri.WorldPhysical", group = "Geo") %>% 
  addProviderTiles("Esri.WorldImagery", group = "Aerial") %>% 
  addLayersControl(
    baseGroups = c("Aerial", "Geo"),
    options = layersControlOptions(collapsed = T)) %>%
  addMeasure() %>% #adds the possibility to measure in the map
  addMiniMap(width = 120, height=80) #Mini map added (also just default map)
m #testing how it looks in console

setwd("~/Desktop/") #For saving the html we set the work directory to desktop
saveWidget(m, file="m.html") #with the htmlwidgets library we can save it as html on the desktop
