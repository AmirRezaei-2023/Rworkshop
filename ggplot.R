install.packages("tidyverse")
install.packages("magrittr")
install.packages("dplyr")  
library(tidyverse)
library(magrittr) 
library(dplyr)  

data()

View(mtcars)

df_mpg = subset(mtcars , mtcars$mpg >30)

mtcars$metric = 0.425 * mtcars$mpg

df3 =mtcars%>%
  group_by(gear)%>%
  summarise(mean(metric))

ggplot(mtcars , aes(x = gear))+
  geom_histogram()+
  labs( x = 'Gears')

ggplot(mtcars , aes(x = mpg , y = metric ))+
  geom_point()+
  geom_smooth(method = 'lm')

ggplot(mtcars , aes(x = mpg , y = metric ))+
  geom_point()
# +scale_color_brewer(palette = 'BuGn')
