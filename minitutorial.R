# looking at current working directory
getwd()

# changing working directory 
setwd('D:/quera')

#Reading data into R by csv
personaldata <- read.csv('person.csv')
personaldata

# show the data frame
View(personaldata)
#Warning! use capital V instead of small v!

# show the data frame in console
print(personaldata)

#show just the name of columns name 
names(personaldata)

#removing the data frame 
remove(personaldata)


