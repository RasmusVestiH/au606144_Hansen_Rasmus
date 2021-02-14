##---------------------------------------------------------------------##
##Author: Rasmus Vesti Hansen                                          ##
##Aarhus University, Aarhus, Denmark                                   ##
##Github:https://github.com/Digital-Methods-HASS/au606144_Hansen_Rasmus##
##---------------------------------------------------------------------##

#### Goals ####

# - Modify the provided code to improve the resulting map

# We highlighted all parts of the R script in which you are supposed to add your
# own code with: 

# /Start Code/ #

print("Hello World") # This would be your code contribution

# /End Code/ #

#### Required R libraries ####

# We will use the sf, raster, and tmap packages.
# Additionally, we will use the spData and spDataLarge packages that provide new datasets.
# These packages have been preloaded to the worker2 workspace.

library(sf)
library(raster)
library(tmap)

#If you don't have the spdata packages they can be download by uncommenting these two lines:
#Installing the spData 
#install.packages("spDataLarge", repos = "https://nowosad.github.io/drat/", type = "source")
#Otherwise you can just run the libraries
library(spData)
library(spDataLarge)


#### Data sets #### 

# We will use two data sets: `nz_elev` and `nz`. They are contained by the libraries
# The first one is an elevation raster object for the New Zealand area, and the second one is an sf object with polygons representing the 16 regions of New Zealand.

#### Existing code ####

# We wrote the code to create a new map of New Zealand.
# Your role is to improve this map based on the suggestions below.

tm_shape(nz_elev)  +
  tm_raster(title = "elev", 
            style = "cont",
            palette = "BuGn") +
  tm_shape(nz) +
  tm_borders(col = "red", 
             lwd = 3) +
  tm_scale_bar(breaks = c(0, 100, 200),
               text.size = 1) +
  tm_compass(position = c("LEFT", "center"),
             type = "rose", 
             size = 2) +
  tm_credits(text = "A. Sobotkova, 2020") +
  tm_layout(main.title = "My map",
            bg.color = "orange",
            inner.margins = c(0, 0, 0, 0))

#### Exercise I ####

# 1. Change the map title from "My map" to "New Zealand".
# 2. Update the map credits with your own name and today's date.
# 3. Change the color palette to "-RdYlGn". 
#    (You can also try other palettes from http://colorbrewer2.org/)
# 4. Put the north arrow in the top right corner of the map.
# 5. Improve the legend title by adding the used units (m asl).
# 6. Increase the number of breaks in the scale bar.
# 7. Change the borders' color of the New Zealand's regions to black. 
#    Decrease the line width.
# 8. Change the background color to any color of your choice.

# Your solution

# /Start Code/ #
tm_shape(nz_elev)  +
  tm_raster(title = "m asl", 
            style = "cont",
            palette = "-RdYlGn") +
  tm_shape(nz) +
  tm_borders(col = "black", 
             lwd = 1) +
  tm_scale_bar(breaks = c(0, 50, 100, 200, 400),
               text.size = 1) +
  tm_compass(position = c("RIGHT", "top"),
             type = "rose", 
             size = 2) +
  tm_credits(text = "R. Vesti Hansen, 2021") +
  tm_layout(main.title = "New Zealand",
            bg.color = "skyblue",
            inner.margins = c(0, 0, 0, 0))

# /End Code/ #

#### Exercise II ####

# 9. Read two new datasets, `srtm` and `zion`, using the code below.
#    To create a new map representing these datasets.

srtm = raster(system.file("raster/srtm.tif", package = "spDataLarge"))
zion = read_sf(system.file("vector/zion.gpkg", package = "spDataLarge"))

# Your solution
print(srtm) #checking if it's rasterLayer
# /Start Code/ #
#Basically for this we use the same formular as above, but with the srtm and zion data instead. 
tm_shape(srtm)  +
  tm_raster(title = "m asl",
            style = "cont",
            palette = "-RdYlGn") +
  tm_shape(zion) +
  tm_borders(col = "grey", 
             lwd = 1) +
  tm_scale_bar(breaks = c(0, 5, 10),
               text.size = 1) +
  tm_compass(position = c("RIGHT", "top"),
             type = "rose", 
             size = 2) +
  tm_credits(text = "R. Vesti Hansen, 2021") +
  tm_layout(main.title = "New Zealand", #Not sure if this also is New Zealand but we name it this anyway.
            inner.margins = c(0, 0, 0, 0))

# /End Code/ #

#Exercise 2
#### Data sets #### 

# We will use two data sets: `srtm` and `zion`.
# The first one is an elevation raster object for the Zion National Park area, and the second one is an sf object with polygons representing borders of the Zion National Park.

srtm <- raster(system.file("raster/srtm.tif", package = "spDataLarge"))
zion <- read_sf(system.file("vector/zion.gpkg", package = "spDataLarge"))

# Additionally, the last exercise (IV) will used the masked version of the `lc_data` dataset.
getwd() #Change the directory to where you have the files stored. 
setwd("C:/Users/Rasmus/Desktop/cds-spatial-main/Week02/HW")

study_area <- read_sf("data/study_area.gpkg")
lc_data <- raster("data/example_landscape.tif")
lc_data_masked <- mask(crop(lc_data, study_area), study_area)



#### Exercise I ####

# 1. Display the `zion` object and view its structure.
# What can you say about the content of this file?
# What type of data does it store? 
# What is the coordinate system used?
# How many attributes does it contain?
# What is its geometry?
# 2. Display the `srtm` object and view its structure.
# What can you say about the content of this file? 
# What type of data does it store?
# What is the coordinate system used? 
# How many attributes does it contain?
# How many dimensions does it have? 
# What is the data resolution?

# Your solution (type answer to the questions as code comments and the code used)

# /Start Code/ #
head(zion)
class(zion)
ncol(zion)
nrow(zion)
st_crs(zion)
crs(zion)
#By running head(zion) we get the information of this being a polygon consisting of 1 feature and 11 fields.
#That means it contains 12 attributes.By looking at the class we see that it says "sf", "tbl_df", "tbl" and "data.frame"
#ncol and nrow further tells us that there are 12 columns and 1 row for zion. 
#With head we can also see the data types are chr, one Date and one polygon (Geomdata). By running 
#st_crs(zion) we can see that the geogcrs is WGS 84. 

head(srtm)
class(srtm)
ncol(srtm)
nrow(srtm)
ncell(srtm)
srtm
st_crs(srtm)
crs(srtm)
# Srtm is a rasterlayer consisting of 457 rows, 465 columns and 212505 cells which can be found by 
# executing the "srtm" on its own. By running it in st_crs we see how this also have the datum of 
# WGS 84


# /End Code/ #

#### Exercise II ####

# 1. Reproject the `srtm` dataset into the coordinate reference system used in the `zion` object. 
# Create a new object `srtm2`
# Vizualize the results using the `plot()` function.
# 2. Reproject the `zion` dataset into the coordinate reference system used in the `srtm` object.
# Create a new object `zion2`
# Vizualize the results using the `plot()` function.


# Your solution

# /Start Code/ #
#First we save the crs for the zion object: 
the_crs <- crs(zion, asText = TRUE)
#Then we transform the crs to srtm2 and as it is a raster we use the projectRaster function.
srtm2 <- projectRaster(srtm, crs = the_crs)
#If we plot this we can then see the zion 
plot(srtm2)
#As we can see the map is now rotated a bit which I hope is right?

#This now shows the raster with the zion coordinates as crs. 
# We can check by looking at the crs(zion)
crs(zion)
crs(srtm2)
#These now have the same crs


#To flip it and do it with zion data but the crs from srtm 
#we use transform as we now take the crs data from a raster to a vector: 
# Transform the zion CRS to match srtm
the_crs2 <- crs(srtm, asText = TRUE)
zion2 <- st_transform(zion, crs = the_crs2) #I create a new variable called the_crs2 for the srtm crs

#This means we have to run the two following plots simultaneously  
plot(srtm)
plot(zion2, add = TRUE)

# /End Code/ #