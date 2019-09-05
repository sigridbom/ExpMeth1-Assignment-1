box <- 9
class(box)
name <- "peter"
class(name) 
a_vector <- c(2,3,4)
cats <- c(2,3,4)
a_vector+3
cats+3
group1 <- c(cats,a_vector)
a_vector[-1]
a_vector[3]
length(a_vector)
a_new_vector <- 3*a_vector
a_new_vector <- c(3, a_new_vector,"car")
rm(box)
a_new_vector[-5]
a_new_vector <- a_new_vector[-5]
vector_Klara <- c(vector_Klara)
#the making of a variable called vector which contains the names of people
vector <- c("Klara","Freya","Kazik","Kasper","Lasse")
#the number of people's siblings
siblings <- c(2,2,2,3,1)
vector+2 #doesn't work because the vector is a character
siblings+2 #works because it is numeric
class(vector) #character
class(siblings) #numeric
#find the sum of the siblings
sum(siblings)
siblings[c(1,2)] #how to find the sum of the first and second number of siblings. 
#You have to put it in brackets, otherwise R thinks it is rows and collumns, 
#when you use brackets, it understands that is only one dimension
sum(siblings[c(1,2)])
#creating a data frame
data.frame(vector,siblings)
#making a new variable
gender <- c("f","f","m","m","m")
#adding the new variable to the data frame
data.frame(vector,siblings,gender)
vector <- c("Klara","Freya","Kazik","Kasper","Lasse","Morten")
siblings <- c(2,2,2,3,1,4)
gender <- c("f","f","m","m","m","m")
data.frame(vector,siblings,gender)
data.frame(name=vector,sibling=siblings,gender=gender)
mean(siblings)
df <- data.frame(name=vector,siblings=siblings,gender=gender)
View(df)

#ADDING A NEW CHARACTER TO THE DATA FRAME USE RBIND
df <- rbind(df,c("Sigrid",1,"f"))
df <- c(df,"Sigrid")
df <- data.frame(vector,siblings,gender)
df <- rbind(df,c("Sigrid",1,"f"))
df[-7,8]
df <- df[-c(7,8),]
df <- rbind(df,c("Sigrid",1,"f")) #problem: vector var ikke defineret som karakter, tjek environment!!
df$vector <- as.character(df$vector) #how to define a character 
df <- rbind(df,c("Sigrid",1,"f")) #how to add a row
df <- df[-7,] #how to delete a row, notice the , because it's two-dimensional

vestervang <- c("Niels","Asger","Sigrid")
vestervang
vestervangAges <- c(21,22,23)
yr <- data.frame(vestervang,vestervangAges)
yr <- data.frame(beboer=vestervang,alder=vestervangAges)
yr
sum(vestervangAges)
mean(vestervangAges)