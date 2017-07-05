data<-read.csv("iris.csv")
set.seed(200)
data$Species <- factor(data$species)

index<-sample(1:nrow(data) , size = 0.7 * nrow(data))
train<-data[index , ]
test<-data[-index ,]

model<- boosting(Species ~ . , data = train , boos = TRUE , mfinal = 5, cv.folds = 10)
summary(model)
predict.boosting(model , newdata = test)$confusion



t1<-model$trees[[5]]


plot(t1)
text(t1,pretty=0)
