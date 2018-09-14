ggplot(mydata, aes(x= Genetic.group, y= Number.of.stems, fill= Genetic.group))+
  coord_flip()+
  geom_boxplot()

rgb(19,41,75, maxColorValue = 255)
rgb(232,74,39, maxColorValue = 255)
par(mfrow = c(1, 1))
plot(mydata$Longitude, mydata$Latitude, col = "#E84A27")


arrowdraw <- function(){
  loc <- locator(2)
  arrows(x0=loc[[1]][1],y0=loc[[2]][1], x1=loc[[1]][2], y1=loc[[2]][2])
}

setwd("/Users/hejiale/499")
library(ggplot2)
library(viridis)
yieldGWAS <- read.csv("Msi_yield_GWAS.csv", stringsAsFactors = FALSE)
str(yieldGWAS)
mhtplt <- function(file, thresholdline = c(5,8)){
  ordered <- dplyr::arrange(file,Chromosome,Position)
  ggplot(ordered,aes(x= Position, y= P.value))+
    geom_bar()+
    facet_grid(Chromosome~Position)+
    xlab("positions")+
    ylab("-log10(P)")
}

ordered <- dplyr::arrange(yieldGWAS,Chromosome,Position)
ordered$Reorder <- as.numeric(rownames(ordered))
# use sapply to get all biggest position for each chromosome
maxposition <- sapply(1:max(ordered$Chromosome),function(x){ max(which(ordered$Chromosome == x))})
ggplot(ordered)+
  geom_point(aes(x= Reorder, y= -log10(P.value), color = Chromosome))+
  scale_x_continuous(label = 1:max(ordered$Chromosome), breaks = maxposition)+
  scale_color_viridis(option = "viridis")+
  xlab("Genomic location")+
  ylab("-log10(P)")

