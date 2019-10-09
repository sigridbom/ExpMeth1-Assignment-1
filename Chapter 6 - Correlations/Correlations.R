#Correlations expmeth lesson 5 9/10 2019

setwd("/Users/sigridnielsen/R studio data/ExpMeth1-Assignment-1/Chapter 6 - Correlations/")

#Calculating the covariance

Sarah = c(1.95,1.58,1.70,2.46,2.27,2.62,3.32,3.51,3.89,3.41)
Mother = c(3.21,4.04,3.30,3.85,4.13,4.59,4.11,4.29,5.82,5.14)

#mean of sarah 2,67
#mean of mother 4,25

multiply = (Sarah - 2.67)*(Mother-4.25)
sum(multiply)/9

#This gives us the covariance

#you could also make a data frame

data <- data.frame(Sarah, Mother)

#calculate the error for the two variables by subtracting the mean
data$error_sarah <- data$Sarah-mean(data$Sarah)
data$error_mother <- data$Mother - mean(data$Mother)

data$mul_error <- data$error_sarah * data$error_mother

#most of the values of the mul_error coloumn are positive, so that indicates a positive relationship
#now find the sum of the variance (the errors)
sum(data$mul_error)

#divide by degrees of freedom
sum(data$mul_error)/(nrow(data)-1

#the covariance is 0,5034244
