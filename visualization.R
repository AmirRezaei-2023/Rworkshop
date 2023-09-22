getwd()
setwd('C:/Users/ASUS/Desktop/r/Rworkshop')
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

#boxplot
help(boxplot)

boxplot(df$LungCap)

q <- quantile(df$LungCap , probs = c(0,0.25,0.5,0.75,1))
q

boxplot(df$LungCap, main= 'Box Plot' , ylab = 'Lung Capacity')

boxplot(df$LungCap, main= 'Box Plot' , ylab = 'Lung Capacity' , ylim = c(0 , 16))

boxplot(df$LungCap ~ df$Gender)

boxplot(df$LungCap ~ df$Gender, main= 'Box Plot' , ylab = 'Lung Capacity', 
        xlab = 'Gender')

boxplot(df$LungCap[df$Gender == 'female'] , df$LungCap[df$Gender == 'male'])

#using cut function 
df$AgeGroup = cut(df$Age , breaks = c(0,13,15,17,25) ,
                  labels = c('<13' , '14-15','16-17','18+'))

table(df$AgeGroup)

boxplot(df$LungCap[df$Age>=18]~df$Smoke[df$Age>=18],ylab = 'Lung Capacity',
        xlab = 'Smoker' ,
        main = 'Effect of smoke on lung capacity of 18+')

boxplot(df$LungCap ~ df$Smoke*df$AgeGroup, main= 'Box Plot' , ylab = 'Lung Capacity', 
        xlab = 'Gender')

boxplot(df$LungCap ~ df$Smoke*df$AgeGroup, main= 'Box Plot' , ylab = 'Lung Capacity'
        , xlab =' ' , las=2)

boxplot(df$LungCap ~ df$Smoke*df$AgeGroup, main= 'Box Plot' , ylab = 'Lung Capacity'
        , xlab =' ' , las=2 , col=c(2,4))

boxplot(df$LungCap ~ df$Smoke*df$AgeGroup, main= 'Box Plot' , ylab = 'Lung Capacity'
        , xlab =' ' ,axes=FALSE , col=c(2,4))
box()
axis(2 , at=seq(0,20,2), seq(0,20,2) , las=1)
axis(1 , at=c(1.5,3.5,5.5,7.5), labels = c('<13' , '14-15','16-17','18+') , las=1)
legend(x=7 ,y=4.5 , legend = c('Non-smoker','Smoker'),col=c(2,4),pch=15,cex=0.8)
