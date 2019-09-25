####CHAPTER 4 Exploring data with graphs 

#install.packages("ggplot2")
library(ggplot2)

personality_test <- read.csv("NEW_CogSciPersonalityTest2019.csv")

#Making graphs 4.4.4

my_graph <- ggplot(personality_test, aes(x = personality_test$gender, y = mean(personality_test$shoesize), colour = gender))

ggplot(personality_test, aes(gender, shoesize))+
  geom_bar(stat = "summary",fun.y=mean)

ggplot(personality_test, aes(gender, shoesize, fill = gender))+geom_bar(stat = "summary", fun.y=mean)
mean(personality_test$shoesize)
my_graph + geom_bar() 
### WHy "must not be used with a y aesthetic???

#setwd("/Users/sigridnielsen/Dropbox/Dokumenter/Uni/1. semester/R studio data/ExpMeth1-Assignment-1")
#setwd("Users/sigridnielsen/ExpMeth1-Assignment-1/") 
#don't move files around when R is open - close R and open it again afterwards
# a trick is to keep a setwd function on the top of the script and then run it everytime you open it

###4.4.8
getwd()
setwd("/Users/sigridnielsen/ExpMeth1-Assignment-1/Chapter 4/")
fb_data <- read.delim("FacebookNarcissism.dat")

fb_graph <- ggplot(fb_data, aes(NPQC_R_Total, Rating))
fb_graph + geom_point(aes(color = Rating_Type), position = "jitter")

### 4.5.1 - Exam anxiety

exam_data <- read.delim("Exam Anxiety.dat")

scatter <- ggplot(exam_data, aes(Anxiety, Exam))
scatter + geom_point() + geom_smooth(method = lm, alpha = 0.1, fill = "Blue") + labs(x = "Exam Anxiety", y = "Exam Performance %")

scatter2 <- ggplot(exam_data, aes(Anxiety, Exam, colour = Gender))
scatter2 + geom_point() + geom_smooth(method = "lm", aes(fill = Gender), aplha = 0.1)

### 4.6 Festival data

festival_data <-read.delim("DownloadFestival.dat")

festival_his <- ggplot(festival_data, aes(day1)) + geom_histogram(binwidth = 0.4)
festival_his + labs(x = "Hygiene (Day 1 of Festival)", y = "Frequency")

fest_box <- ggplot(festival_data, aes(gender, day1)) + geom_boxplot()
fest_box + labs(x = "Gender", y = "Hygiene (Day 1 of the Festival)")
festival_data <- festival_data[order(festival_data$day1),]

####4.8 denisity plots

fest_noout <- read.delim("DownloadFestival(No Outlier).dat")

density <- ggplot(fest_noout, aes(day1))
density + geom_density() + labs (x = "Hygiene day 1", y = "Density Estimate")

#### 4.9.2. Chick flick

chick_flick <- read.delim("ChickFlick.dat")
bar <- ggplot(chick_flick, aes(film, arousal, fill = gender))
bar + stat_summary(fun.y=mean, geom = "bar", fill = "White", colour = "Black") + stat_summary(fun.data = mean_cl_normal, geom = "pointrange")
bar + stat_summary(fun.y = mean, geom = "bar", position = "dodge") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", position = position_dodge(width = 0.90), width = 0.2)

bar <- ggplot(chick_flick, aes(film, arousal, fill = film))
bar + stat_summary(fun.y = mean, geom = "bar") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.2) + facet_wrap( ~ gender)