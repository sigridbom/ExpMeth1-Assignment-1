####CHAPTER 4 Exploring data with graphs 

install.packages("ggplot2")
library(ggplot2)

personality_test <- read.csv("NEW_CogSciPersonalityTest2019.csv")

#Making graphs

my_graph <- ggplot(personality_test, aes(x = personality_test$gender, y = mean(personality_test$shoesize), colour = gender))

my_graph + opts(title = "Test")

my_graph + geom_bar() 
### WHy "must not be used with a y aesthetic???