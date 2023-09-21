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

#creating numbers vectors
x = c(1,2,3,4,5,6,7)
# creating integers vector 
x = 2:10
x = seq(3, 10)
x = seq(10)

#creating the vector of characters
x = c('male','famel')
#Warning! the '=' and '<-' are equal in R

#creating the sequence of integer values
seq(from=1 , to=8 , by=1)
#seq.int will be rounded up if fractional
seq.int(from=1, to=4 , by= 0.3)
#creating the sequence of non-integer values
seq(from=1 , to=8 , by=0.25)
#creating the sequence of values with specific length
seq(from=1, to=4 , length.out= 5)
seq(3, 10, along.with = 1:5)

#repeating the characters
rep(1,times=10)
rep('amir',times=10)
rep(seq(1,4, by=0.5),times=5)
rep(c('male','female') , times=3)

#creating the vectors and some mathematical things
x = 1:5
y = c(1,3,5,7,9)
x+10
x-10
x*7
x/7

 # if the length of two vectors are same, we are able to add/multiple/devide 
x+y
x-y
x/y
y/x

#recaling the specific elements in vector
x[3]
y[1]
#Warning! R does not count pythonic (from 0) the index starts from 1 
x[-3]  
x[1:3]
x[c(1,3,5)]
x[-c(1,3,5)]

#conditional slicing
x[x>3]

#making matix
matrix(1:9, nrow =3)
matrix(1:9, nrow =3 , byrow=TRUE)

#get specific element in matrix
c = matrix(1:9, nrow =3 , byrow=TRUE)
c[1,3]
c[c(1,2),2]
c[3,]

#dimansion of data frame
dim(dataframe_name)
dataframe_name[1:5,1:3]

#logic statments
data()
df <- trees
temp<-df$Volume >20
temp[1:10]
df$Volume[1:10]
temp2 <- as.numeric(temp)
temp2
temp3 <- df$Volume >15 & df$Height >66
temp3
new_df <- cbind(df , temp3)
new_df

#finding mean of column
mean(dataframe_name$column_name)
mean(dataframe_name$column_name[dataframe_name$column_name == 12])
mean(dataframe_name$column_name[dataframe_name$column_name == 1999])

#creating the new data frame by subsetting 
new_dataframe_name = dataframe_name[dataframe_name$column_name == 1997,]
df4 = df[df$year == 1997 & df$runtime >116,]

#removing the data frame 
remove(dataframe_name)

#removing all objects in r
rm(list = ls())

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
