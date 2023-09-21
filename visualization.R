df <- read.csv('LungCapData.xls - LungCapData.txt.csv')

#barplot
?barplot
#Barplot is a visualization of frequency for each category

table(df$Gender)
table(df$Smoke)
table(df$Caesarean)

freq <- table(df$Gender)

rel_freq <- table(df$Gender) /725

freq
rel_freq

barplot(freq)

barplot(rel_freq)

barplot(rel_freq , main = 'Sex')

barplot(rel_freq , main = 'Sex' , xlab = 'Gender' , ylab = 'Percentage' , 
        names.arg = c('Female', 'Male'))

barplot(rel_freq , main = 'Sex' , xlab = 'Gender' , ylab = 'Percentage' , 
        names.arg = c('Female', 'Male'), horiz = TRUE)

pie(freq)

pie(freq , main = 'Sex')


box()
