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



