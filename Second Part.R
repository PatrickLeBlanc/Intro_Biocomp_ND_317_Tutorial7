rm(list=ls())

#Load ggplot
library(ggplot2)
library(grid)
library(gridExtra)

CoffeeDeathTable=read.csv(file="CoffeeDeath.csv",header=FALSE,stringsAsFactors=FALSE)

a=ggplot(data=CoffeeDeathTable,aes(x=CoffeeDeathTable[,1],y=CoffeeDeathTable[,2]))
a+geom_point()+xlab('Amount of Coffee Consumed by the Average American (gallons)')+ylab('Number of people killed by misuing a nonpowered hand tool.')+geom_smooth(method=lm,se=FALSE)
