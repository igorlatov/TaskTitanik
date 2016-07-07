#Reading the dataset
titanic <- read.csv("~/TaskTitanik/titanic.csv")
library(dplyr)
library(tidyr)
#The embarked column has some missing values, 
#which are known to correspond to passengers who actually embarked at Southampton. 
#Find the missing values and replace them with S. There can be blank / empty strings

# 1.1. Getting rid of empty values and NA variables. I use as.character to apply length() function
# for the for cycle
new.embarked <- titanic$embarked
# replacing all variables that are not available or absent good with "S"
new.embarked[which(new.embarked == "")] <-"S"
new.embarked[which(is.na(new.embarked))] <-"S"
new.embarked[which(is.null(new.embarked))] <-"S"

# 1.2 Now it's time to drop old embarked for the new ones. I check with embarked[169] which was "", now is "S"
tit <- titanic

tit <- tit %>%  
  mutate(embarked = new.embarked)

# Now tit contains no empty or na values. Ready for task 2.

# Calculating the mean age and replacing NAs with Mean
mu_age <- mean(tit$age, na.rm = TRUE)
tit$age[which(is.na(tit$age))] <-mu_age

# Filling Lifeboat with dummy string for passengers who did not make it
tit$boat <- as.character(tit$boat)
tit$boat[which(tit$boat=="")] <-"NA"

#Cabin 
has_cabin_number <- as.character(tit$cabin)
has_cabin_number <- if_else (has_cabin_number == "", 0, 1)
tit$has_cabin_number <- as.factor(has_cabin_number)
glimpse(tit)
#Publishing the result
write.csv(tit,"titanic_clean.csv")
  