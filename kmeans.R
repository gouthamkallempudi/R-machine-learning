
data<-read.csv("iris.csv")
species<-data[c(5)]
new_data<-data[c(1,3,5)]
data<-data[c(1 , 3)]


wss <- sapply(1:30,function(k){kmeans(data, k,iter.max = 30 )$tot.withinss})
plot(1:30, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

fit <- kmeans(data, 3)




plot(data,col =(fit$cluster +1), main = "% of favourable responses to
     Learning and Privilege", pch =20, cex =2)

