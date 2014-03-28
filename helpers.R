load("~/Desktop/shinytest/test/Data/mydata.dtm.Rda")
load("~/Desktop/shinytest/test/Data/frequency.Rda")
load("~/Desktop/shinytest/test/Data/Displaymatrix.Rda")
load("~/Desktop/shinytest/test/Data/Displayfreq.Rda")
load("~/Desktop/shinytest/test/Data/Dataset2.Rda")
load("~/Desktop/shinytest/test/Data/Dataset1.Rda")
load("~/Desktop/shinytest/test/Data/Classdata.Rda")
load("~/Desktop/shinytest/test/Data/clusdata.rda")
load("~/Desktop/shinytest/test/Data/result1.Rda")
load("~/Desktop/shinytest/test/Data/testCl.Rda")
library("tm")
library("Rcpp")
library("wordcloud")
library("ggplot2")
library("lattice")
library("caret")
library("e1071")

asso_cloud=function(word){
  temp=findAssocs(mydata.dtm,'word',0.2)
  t1=rownames(temp)
  t2=rownames(mydata.dtm)
  i=t2%in%t1
  wcmydata=as.matrix(mydata.dtm)
  newdata=wcmydata[i,]
  wordFreq=sort(rowSums(newdata),decreasing=TRUE)
  wordcloud(word=names(wordFreq),freq=wordFreq, min.freq=50, random.order=F,colors=rainbow("5"))
}

hplot=function(i){
  plot(hclus, main="Hierarchical Clustering",xlab="Terms")
  rect.hclust(hclus,k=i,border="red")
  groups=cutree(hclus,k=i)}

kclus=kmeans(clusdata,5)

ks=function(n){
kcenter=round(kclus$centers,digits=3)
  for(i in 1:5) {
    cat(paste("cluster", i, ": ", sep=""))
    s=sort(kclus$centers[i,], decreasing=T)
    cat(names(s) [1:n], "\n")}
}

confusionMatrix(result1,testCl)

