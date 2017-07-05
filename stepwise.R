#reading the csv file
data<-read.csv("sachinstep.csv")
data[,'Runs'] <- as.numeric(as.character(data[,'Runs']))


#ommiting na values

data<-na.omit(data)
 
#model<-lm(Runs~Mins,data=data)
#summary(model)

#building a linear regression model
model<-lm(Runs~Mins+X6s,data=data)
summary(model)






