#Reading the dataset
titanic <- read.csv("~/TaskTitanik/titanic.csv")
library(dplyr)
library(tidyr)
#The embarked column has some missing values, 
#which are known to correspond to passengers who actually embarked at Southampton. 
#Find the missing values and replace them with S. There can be blank / empty strings

# 1.1. Getting rid of empty values and NA variables. I use as.character to apply length() function
# for the for cycle
new.embarked <- as.character(titanic$embarked)

for (i in 1:length(new.embarked)) {
 if (is.na(new.embarked[i]) == TRUE) {
  new.embarked[i]<- "S"
 } else if ( new.embarked[i] =="") {
  new.embarked[i]<- "S"
 } 
}

# 1.2 Now it's time to drop old embarked for the new ones
tit <- titanic

tit <- tit %>%  
  mutate(embarked = new.embarked)

glimpse(tit)


head(titanic$embarked, 100)
head(tit$embarked, 100)

mutate(airquality, new = -Ozone)
