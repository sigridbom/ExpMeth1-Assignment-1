read.table(?)
?read.table

df <- read.csv("NEW_CogSciPersonalityTest2019.csv")

#how to load a package from the library
library(pacman)

#pacman = package manager

#if you don't want to load the package everytime you start R + installs the package if you don't have it
pacman::p_load(tidyverse)

#filter for shoesize 40 (the same thing as subsetting subset() )
shoes40 <- filter(df,shoesize==40)


#how to find someone with different criteria
male_lefthanded <- filter(df, df$gender == "male" & df$handedness == "Left-handed" )

#########EXERCISE 1

#how to find the people with size 39 or bigger
bigfoot_data <- filter(df,shoesize >= 39)

#people who were able to touch the floor (yes or yes of course)
#how to find the different possible answers
levels(df$touch_floor)

#you now have the different options in your console
touch_the_floor <- filter(df,df$touch_floor == "Yes, of course!!"| df$touch_floor == "Yes")
#or
touch_the_floor <- filter(df,df$touch_floor %in% c("Yes, of course!!", "Yes"))

#how to get the names of the 49 observations
touch_the_floor["name"]

#who were able to hold their breath longer than average
max(df$breath_hold)

long_breath <- filter(df,df$breath_hold > mean(df$breath_hold))
#just checking
mean(df$breath_hold)
long_breath["name"]

#who could balance a balloon between 13 and 60 sec?
balance <- filter(df, df$balloon_balance > 13 & df$balloon_balance < 60)

#all of the before mentioned things
all_above <- filter(balance, shoesize >= 39 & breath_hold > mean(breath_hold) & touch_floor == "Yes, of course!!" | touch_floor == "Yes")

#det første der står i parentesen er "balance" fordi vi nu kigger i "balance" data framen, so I am looking for the following columns in 
#the data frame balance - shoesize but larger or equals 39, the breathold column but only a specific interval and so on.

##### How to arrange in order
#alphabetical

arrange(df, name)

#reorder it by colum number

arrange(df,desc(name))

RankingTable <- arrange(df,desc(shoesize),desc(balloon_balance))


####Exercise 2
#slowest tonguetwister if you want the largest number at the top use desc ()
#if you want the lowest number do the function without desc()
slowest_tongue <- arrange(df,desc(tongue_twist))

#student who performed best in the romberg task
best_romberg <- arrange(df,desc(romberg_closed))

#how could you improve - by comparing both, first by romberg_closed (the same with these numbers though..)
new_best_romberg <- arrange(df, desc(romberg_closed), desc(romberg_open))

