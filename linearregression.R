library(gbm)


data<-EuStockMarkets
index <- sample(1:nrow(data) , size=0.7*nrow(data))
train<-data.frame(data[index,])
test<-data.frame(data[-index,])


set.seed(1)
model <- lm(FTSE~. , data =train)