#load library
library(MASS)
#load data
admit<-read.csv("admission.csv")
head(admit)
#set seed
set.seed(40)
#splitting the data
index<-sample(1:nrow(admit),size=0.7*nrow(admit))
train<-admit[index,]
test<-admit[-index,]
train$De <- factor(train$De)
#plotting the data
plot(train$GPA , train$GMAT , col = train$De)
#applying model
model<-lda(De~. , data =train)
#printing model
model
#predictions on test data
values<-predict(model,newdata=test)
#projecting the matrix into LD1
l<-test[,1:2]
l<-as.matrix(l)
k=as.matrix(model$scaling[,1])
q<-matrix(0 , nrow=26 , ncol=1)
a = l%*%k
a<-cbind(a,q)
#plotting the data
plot(a[,1],a[,2])
text(a[,1],a[,2],test$De,cex=0.7,pos=4,col="red")