# this is Adela's guide without testing or having data, so it may still need troubleshooting, especially in grabbing correct columns

library(tidyverse)
data <- vector() #create empty vector for interim municipality values through time
final <- NULL #create empty object for final values

for (i in population$municipalities){
  x <- abortions %>% select(distinct(municipalities == i))  
  for (j in 1995:2018){ # check that correct columns are grabbed, use 2:ncol
    newvalue <- as.numeric(abortions[x,j])/as.numeric(population[i,j])
    data <- c(data, newvalue) # check if it survives outside the loop
  }
  final <- rbind(final, data)
}
