---
  title: "HW8 - Web Scraping"
author: "Rasmus Vesti Hansen"
date: "2/11/2020"
output: html_document
---

#Starting of by getting the libraries loaded for the code
library("rvest")
library("dplyr")

#Note before. This is in an unfinished project of scraping/cleaning data. I appreciate any advice with open arms and gratitude

#I choose option 2 in the assignment were I wanted to created a tibble in R based on the table on wikipedia in the url below. 

#Firstly I created a vector called "indbygkom" (resident pr. commune) of the html using the "rvest" and SelectorGadget tools that lets us select the "td" on the webpage. 
indbygkom <- html("https://da.wikipedia.org/wiki/Kommuner_i_Danmark_efter_indbyggertal")
indbygkom <- indbygkom %>%
  html_nodes("td") %>% 
  html_text()
#When testing this it does not show all as it limits at 1000 characters. 
indbygkom

options(max.print=1000000) #This code extends the limit one million, which is more than needed as there is 1176 entries in the vector


#Then I create a tibble for sorting the vector 
indbygkomTib <- tibble(indbygkom)
                       
#As this then creates a tibble of all the data but set as individual rows I got stuck. I spent a lot of time trying to figure out what to do

#I tried writing it as a csv file but that only gave me the this:

#Length     Class      Mode 
#1176 character character 

#As a file, which I can't really do anything with. But along the way I managed to add columns with the following code:
indbygDF <- read.csv(
  file = "indbygkom.csv"
  , header = FALSE
  , col.names = c("rang","by", "km2", "1980", "1990", "2000", "2006", "2014", "2018", "2019", "indb pr. km2", "region") )

indbygkomTib #testing if I messed up the tibble in different attempts to re-write the code
indbygDF #Looking at the Data frame created based on the csv file, which of course could only fail

#In the end I realized that I did manage to scrape data I wanted and data that is relevant for my final project
#But I simply cannot find the solution for cleaning it in a way that would arrange the rows sorted by index (or something like that) into the columns listed above





