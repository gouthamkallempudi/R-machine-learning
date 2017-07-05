data<-read.csv("iris.csv")
set.seed(200)
data$Species <- factor(data$species)

iris.prune <- autoprune(Species~. , data)

data(iris)
iris.adaboost <- boosting(Species~., data, boos=TRUE, mfinal=100)
iris.adaboost$errors

