#load necessary libraries
library(tidyverse)
library(dplyr)
library(readr)
library(tidyr)

#load titanic working dataset
titanic <- read_csv("~/Github/Springboard_Foundations_Data-Refine_02/titanic_original.csv")

#1: Port of embarkation
#Change NA in "embarked" column to "S"
#titanic$embarked[is.na(titanic$embarked)] <- "S"

# a way to do whis with chaining and dplyr
titanic <- titanic %>%
  mutate(embarked = replace(embarked, is.na(embarked), "S")) %>%
  mutate(embarked = replace(embarked, embarked=="", "S"))

#2: Age
#Change NA in "age" column to the mean of all other ages
#titanic$age[is.na(titanic$age)] <- mean(titanic$age, na.rm = TRUE)

# doing #2 with chaining and dplyr
titanic <- titanic %>%
  mutate(age = replace(age, is.na(age), mean(age, na.rm=TRUE)))

#3: Lifeboat
#Change NA in "boat" column to a string "None" (an "NA" string seemed confusing)
titanic$boat[is.na(titanic$boat)] <- "None"

#4: Cabin
#Create a new column called "has_cabin_number" that is 1 if TRUE and 0 if FALSE

#First, I replaced NA values with "None" strings to make the values more easily workable.
#titanic$cabin[is.na(titanic$cabin)] <- "None"

#Then, I added the column with a 1 if the cabin was not "None" and a 0 if it was
#titanic <- titanic %>% mutate(has_cabin_number = as.numeric(titanic$cabin != "None"))

# doing #4 with chaining and dplyr
boat_clean <- age_clean %>%
  mutate(boat = replace(boat, is.na(boat), "None"))
cabin_clean <- boat_clean %>%
  mutate(has_cabin_number=as.integer(!is.na(cabin)))

#Output to a clean file
write_csv(titanic, "titanic_clean.csv")