library(mlbench)
data("PimaIndiansDiabetes")
head(PimaIndiansDiabetes)

set.seed(100)
#splitting the data
index <- sample(1:nrow(PimaIndiansDiabetes) , size = 0.7 * nrow(PimaIndiansDiabetes))
train_data <- PimaIndiansDiabetes[index ,]
test_data <-PimaIndiansDiabetes[-index ,]

x_train<-train_data[,-9]
y_train<-train_data[,9]

x_test<-test_data[,-9]
y_test<-test_data[,9]

x<-cbind(x_train , y_train)

logistic<-glm(y_train~.,data=x,family='binomial')
predicted<-predict(logistic , x_test,type='response')