# looking at current working directory
getwd()

# changing working directory 
setwd('path')

#Reading data into R by csv
moviedata <- read.csv('movie.csv')
moviedata

# show the data frame
View(personaldata)
#Warning! use capital V instead of small v!

# show the data frame in console
print(personaldata)

#show just the name of columns name 
names(personaldata)

#removing the data frame 
remove(personaldata)

#merging data in R
#Warning! this function is able to merge just two data frame at moment
#read in another data frame
genredata <- read.csv('genre.csv')
genredata
#Help =  you can use below command to get help in coding 
#?merge
mergeddf <- merge(x = genredata , y = moviedata , by.x='movie_id', by.y='id')
mergeddf
#Warning! if the common column has same name in both data frame you can use (by = 'column_name') easily
new_mergeddf <- merge(x = moviedata , y = genredata , by.x='id', by.y='movie_id')
new_mergeddf 
#Warning! in inner join you dont need any option extra


#full merge 
full_mergeddf <- merge(x = moviedata , y = genredata , by.x='id', by.y='movie_id' , all=TRUE)
full_mergeddf
#Warning! by this,you get all rows even if there is not corresponding value in other data frame 

#left merge 
left_mergeddf <- merge(x = moviedata , y = genredata , by.x='id', by.y='movie_id' , all.x=TRUE)
left_mergeddf

#right merge 
right_mergeddf <- merge(x = moviedata , y = genredata , by.x='id', by.y='movie_id' , all.y=TRUE)
right_mergeddf

#Subsetting Cases From a Data Frame in R 
#determin the structure of object in R
str(datafram_name)
#Warning! str() in not for type casting like Python. it's for structure of object.

#subset function
subset(dataframe_name , column_name == 'value')

#Logical operators in R
| OPERATORS | NAME | DESCRIPTION |EXAMPLE|
| --------------- | --------------- | --------------- | --------------- |
| & | AND | It returns true when both conditions are true | c(20, 30) & c(30, 10) |
| && | AND | Same as the above but, It works on single element | If (age > 18 && age <= 25) |
| | | OR | It returns true when at-least one of the condition is true | c(20, 30) | c(30, 10) |
| || | OR | Same as logical OR but, It works on single element | If (age == 35 || age < 60) |
#more can be find in https://www.w3schools.com/r/r_operators.asp

subset(dataframe_name , column_name == 'Drama' | column_name == 4016934)

subset(dataframe_name , column_name == 'Drama' & column_name == 4016934)

subset(dataframe_name , column_name %in%c(48473,53198))

subset(dataframe_name , !column_name %in%c(48473,53198))

#Type casting 
dataframe$column_name <- as.Date(dataframe$column_name, format = '%m/%d/%y')
#Warning! if you get any error you can use below code
dataframe$column_name <- as.Date(as.character(dataframe$column_name), format = '%m/%d/%y')

subset(dataframe_name , date_column > as.Date('date_value'))

#Selecting one variable from dataframe
dataframe_name$column_name
#it returns variable as a vector 
subset(dataframe_name , select = column_name)
#it returns the variable as a data frame

#selecting multiple variables 
subset(dataframe_name , select=c(column_name,column_name,column_name))

#removing one variable from data frame
dataframe_name$column_name <- NULL
subset(datafra,e_name , select = -column_name)
subset(dataframe_name , select= -c(column_name,column_name,column_name))

#writing data frame  from R
write.csv(dataframe_name , 'file_saving_name')

#making copy of data frame
copy_name <- cbind(dataframe_name)

