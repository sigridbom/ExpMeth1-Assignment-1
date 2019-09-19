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
shoes_39 <- filter(df,shoesize >= 39)

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

new_best_romberg <- rowSums(df, df$romberg_closed > mean(df$romberg_closed) & df$romberg_open > mean(df$romberg_open)
romberg_total <- rowSums(df[c("romberg_closed","romberg_open")])
romberg_winner <- data.frame(df["name"],romberg_total)
view(romberg_winner)

romberg_winner_total <- arrange(romberg_winner,desc(romberg_total))
view(romberg_winner_total)
                            
class(df$romberg_closed)
class(df$romberg_open)
df$romberg_closed <- as.numeric(df$romberg_closed)
df$romberg_open <- as.numeric(df$romberg_open)

##SELECT TESTING
select(df, name, gender)
#gives you the two columns you asked for in the console 

select(df, name:gender)
#gives you the columns from name to gender (which includes birthday and shoesize)

select(df, -c(name:gender, vis_duck:taste_blind))
#gives you everything between the intervals of the mentioned columns (notice the minus)

select(df, gender, everything())
#puts gender first and everything after in the console. 

####EXERCISE 3!!!!!!!!!

#1. What happens if you select the same column name multiple times? 
select(df, name, name, name)
#nothing?

#2. Make a vector
vars = c(df$name, df$shoesize, df$touch_floor)
#what happens when you use this vector to select from the data frame?
select(vars) #doesn't work
vars
#the select function doesn't work with the vector. and if I just type the vector it gives me that data as weird 
#numbers that don't seem to be in order.... 

#3 Rearrange your dataframe with gender and shoesize first (use everything())

select(df,gender,shoesize,everything())

#mutate()

mutate(df, cealing = (romberg_closed == 120))
mutate(df, cealing = (romberg_closed == 120 & romberg_open == 120))

#EXERCISE 4!!!!!
#1. Calculation of how many words each student said pr. sec in the tonguetwister (99 words in total) in a new column

mutate(df, words_per_sec = (99/tongue_twist))

#2. Currently breath_hold is in seconds. Convert it to two new columns called ”breath_min” and ”breath_sec”, 
#containing the number of whole minutes (achieved by dividing using %/%) and remaining seconds respectively.

mutate(df, breath_min = (breath_hold %/% 60), breath_sec = (breath_hold %% 60))

#   % / % function = says how many times you can divide x by y as a whole number, example 7 %/% 3 = 2
#   % % function = tells us the remaning numbers by whole-number-division, example 7%%3 = 1

#3. Create a new column where you calculate how far each student is from the average words pr sec

mutate(df, average_words_per_sec = ((99/tongue_twist) - mean(99/tongue_twist)))

mean(99/df$tongue_twist)

### Summarize
summarise(df,mean(shoesize))

by_gender <- group_by(df, gender)
summarise(by_gender, mean(shoesize))
#you get a mean value for females and a mean value for men in shoesize
#when you want to find the mean of a column you can use summarise() or mean()
#but by grouping that column into two or more categories you get a mean for each of these categories, 
#ex male and female mean showsize

#the easier way of doing this = pipes 

###EXERCISE 5

%>% reads ‘send the resulting dataframe(s) to the following function’.
Shortcut cmd+shift+M (MacOS) 
#1 Is there a gender difference when it comes to balloon balancing?

df %>% group_by(gender) %>% summarise(mean(balloon_balance))

#2 Is there a relation between sound level preference and which cola was chosen?

df %>% group_by(taste_cola) %>% summarise(mean(sound_level_pref))

#3 Does handedness influence tongue twisting speed?

df %>% group_by(handedness) %>% summarise(mean(tongue_twist))

#3a Can you add a column to the summary which contains number of people in each group 
(e.g. number of right handed people), hint: look at the n() function

#3b Does this tell us anything about the estimates?
