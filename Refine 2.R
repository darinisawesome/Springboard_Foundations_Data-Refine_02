#load necessary libraries
library(tidyverse)
library(dplyr)
library(readr)
library(tidyr)

#load titanic working dataset
titanic <- read_csv("~/Github/Springboard_Foundations_Data-Refine_02/titanic_original.csv")

#1: Port of embarkation
#Change NA in "embarked" column to "S"
titanic$embarked[is.na(titanic$embarked)] <- "S"

#2: Age
#Change NA in "age" column to the mean of all other ages
titanic$age[is.na(titanic$age)] <- mean(titanic$age, na.rm = TRUE)

