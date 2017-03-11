#Clustering Analysis
#MotorTrend Cars
data(mtcars)
mtcars[1:5,]
mtcars1<- mtcars[,c(1:4,6:7,9:11)]
mtcars1(1:5)
#Three major kinds of clustering
# 1 :Split data set into n number of clusters (eg: kmeans)
# 2 : Hierarchical: Start seperate and combine
# To perform HC , need distance matix (dissimilarity matrix)
dd <-dist(mtcars1)
dd #Huge Matrix
# Use distance matrix for clustering
c <- hclust(dd)
c
#Plot dendogram of clusters
plot(c)
#Put Obseravations in groups
#need to specify either k=groups or h=height
g3<-cutree(c,k=3) #"g3"="group3"
g3
plot(g3)
#Group multiple, use it in cutree
gm <- cutree(c,k=2:5)
gm
#Draw Boxes around clusters
rect.hclust(c,k=2,border='red')
rect.hclust(c,k=3,border='blue')
#different variables leads to different clusters
rect.hclust(c,k=4,border='green')
rect.hclust(c,k=5,border='pink')
# K-Means Clustering on MTCARS
km <- kmeans(mtcars1,3)
km
#THREE CLUSTERS WITH VARIOUS SIZES.
summary(dd)
#Graph based on k0means
require(cluster)
clusplot(mtcars1,km$cluster,color = T)
