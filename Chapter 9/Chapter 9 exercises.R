#Chapter 9 exercises
 getwd()
setwd("~/R studio data/ExpMeth1-Assignment-1/Chapter 9/")
getwd()

#downloading packages
pacman::p_load("pastecs", "tidyverse", "WRS2", "Rcmdr")

spiderlong_data <- read.delim("SpiderLong.dat")
spiderwide_data <- read.delim("SpiderWide.dat")

#finding the mean for anxiety comparing the picture and the real condition for each participant
spiderwide_data$pMean <- (spiderwide_data$picture + spiderwide_data$real)/2

#finding the grand mean (the mean of all scores regardsless of what condition the score came from)
#using the c function to bind the data in the two columns 
grandMean <- mean(c(spiderwide_data$picture, spiderwide_data$real))
# the grand mean is 43,5 

#calculating an adjustment factor by subtracting each partipant's mean from the grand mean
spiderwide_data$adj <- grandMean - spiderwide_data$pMean

#we can now use these adjustment values to eliminate the between-subject differences in anxiety 
# adjusting the values for the picture condition by adding the score to the adjustment values
spiderwide_data$picture_adj <- spiderwide_data$picture + spiderwide_data$adj

#creating adjusted values of "real"
spiderwide_data$real_adj <- spiderwide_data$real + spiderwide_data$adj

#testing
pMean2 <- mean(c(spiderwide_data$picture_adj, spiderwide_data$real_adj))
