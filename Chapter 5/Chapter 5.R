### CHAPTER 5 ExpMeth 

pacman::p_load(ggplot2, car, pastecs, psych)
getwd()
setwd("/Users/sigridnielsen/ExpMeth1-Assignment-1/Chapter 4/")

dlf <- read.delim("DownloadFestival.dat")

setwd("/Users/sigridnielsen/ExpMeth1-Assignment-1/Chapter 5/")

hist.day1 <- ggplot(dlf, aes(day1)) + geom_histogram(aes(y = ..density..)), colour = "black", fill = "white") + labs (x = "Hygiene score on day 1", y = "Density")
hist.day1 + stat_function(fun = dnorm, args = list(mean = mean(dlf$day1, na.rm = TRUE), sd = sd(dlf$day1, na.rm = TRUE)), colour = "black", size = 1)

## q-q plot

qqplot.day1 <- qplot(sample = dlf$day1, stat = "qq")
qqplot.day1

qqplot.day2 <-qplot(sample = dlf$day2, stat = "qq")
qqplot.day2

##5.5.2

describe(dlf$day1)
stat.desc(dlf$day1, basic = TRUE, norm = FALSE)

describe(cbind(dlf$day1,dlf$day2,dlf$day3))
stat.desc(cbind(dlf$day1,dlf$day2,dlf$day3), basic = FALSE, norm = TRUE)

