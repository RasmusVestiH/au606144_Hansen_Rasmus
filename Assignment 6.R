---
title: "HW6 - Functions"
author: "Rasmus Vesti Hansen"
date: "26/10/2020"
output: html_document
---
  
# Question 1
  
#Define a defensive function that calculates the Gross Domestic Product of a nation from the 
#data available in the gapminder dataset. Using that function, calculate the GDP of Denmark 
#in the following years: 1967, 1977, 1987, 1997, 2007, and 2017.

#For this we start by loading the libraries and disable the scientific notation

```{r load_lib}
library(gapminder)
library(tidyverse)
options(scipen = 999) #disable scientific notation

# Then we create the function for 
```{r create_function}
calcGDP <- function(dataset, year=NULL, country=NULL) {
  if(!is.null(year)) { #Here we ensure that the year is not null
    dataset <- dataset[dataset$year %in% year,] #this will then set dataset by year
  }
  if (!is.null(country)) { #Ensuring country is not null
    dataset <- dataset[dataset$country %in% country,] #subset the dataset by country
  }
  
  gdp_result <- dataset$pop * dataset$gdpPercap #by multiplying GDP per capita with the total population we calculate gdp.
  #Then save the result in the object "gpd_result"
  
  new_column <- cbind(dataset, gdp=gdp_result) #at last we create a new column called GDP containing the object "gdp_result" 
  return(new_column)
}
```
#Then we can plot the years we want to look up in the following code to calcute the GDP of Denmark
calcGDP(gapminder, year=1967, country="Denmark")


#Question 2
# Write a script that loops over each country in the gapminder dataset, tests whether the country starts with a ‘B’,
# and print out whether the life expectancy is smaller than 50, between 50 and 70, or greater than 70.


Bcountries <- grep("^B", unique(gapminder$country), value=TRUE) #The grep function searches for matches with the "^B" pattern in the gapminder dataset.


for (LifeEx in Bcountries) { #We make a for loop, that loops through Bcountries
  compare <- mean(gapminder[gapminder$country == LifeEx, "lifeExp"]) # Creating an object called compare for future purpose
  if(compare >= 70){ #Then we use if, if else and else sentences to print different sentences depending on how high the lifeexpectancy is.
    print(paste("If you live in", LifeEx, ",you are gonna live a loooooong time")) }  
  else if (compare>=50) {
    print(paste("If you live in", LifeEx, ",you are going to die in your best age"))}
  else { print(paste("If you live in", LifeEx, ",don't count on living to long..."))
  }
}

