
#load the data
my_data <- read.csv("stock.csv")
#visulaization of data
head(data, 2)
dim(data)
#setting the seed
set.seed(5)
#splitting the data
index <- sample(1:nrow(data) , size = 0.7 * nrow(data))
train_data <- my_data[index ,]
test_data <- my_data[-index ,]

#linear model
model <- lm(Company10 ~ ., data = my_data)
#summary of the model
summary(model)
preds<-predict(model , newdata=my_data)
preds

