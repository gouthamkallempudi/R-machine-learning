
library(MASS)
library(rattle)


data(wine, package='rattle')
attach(wine)
head(wine)

wine_data <- lda(Type ~ ., data=wine)
wine_data
wine.lda.values<- predict(wine.lda)

plot(wine.lda.values$x[,1],wine.lda.values$x[,2]) 
text(wine.lda.values$x[,1],wine.lda.values$x[,2],Type,cex=0.7,pos=4,col="red")