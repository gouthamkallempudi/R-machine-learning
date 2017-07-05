# loading library
library("HSAUR")
#loading data
data("heptathlon",package = "HSAUR")
new_data<-heptathlon
# normalizing data
for(i in 1:ncol(new_data))
{ 
  new_data[,i] <- max(new_data[,i]) - new_data[,i]
}
#finding correlation
round( cor(new_data) ,2 )
#appling principal component analysis
new_data_pca <- prcomp(new_data, scale = TRUE )
#printing the model
print(new_data_pca)
#summary of the model
summary(new_data_pca)
#projecting the original data into principal component
scale(new_data)  %*% new_data_pca$rotation[,2]
#ploting the data
plot(new_data_pca)
plot(new_data_pca,type = 'l')

biplot(new_data_pca, col = c("black", "gray"))
