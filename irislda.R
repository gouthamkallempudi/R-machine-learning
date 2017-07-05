
library(MASS)
library(rattle)
library(datasets)


data<-read.csv("iris.csv")

model<- lda(Species~ .,data )
model

#plot(data[,1:4],model,cex=0.7,dimen=2)
#plot(model,cex=0.7,dimen=2)
values <- predict(model)
plot(values$x[,1],values$x[,2])
text(values$x[,1],values$x[,2],data$Species,cex=0.7,pos=4,col="red")