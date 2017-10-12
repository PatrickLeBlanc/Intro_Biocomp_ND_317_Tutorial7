rm(list=ls())

#Load ggplot
library(ggplot2)
library(grid)
library(gridExtra)

##############################The First Part

#Initialize Dataframes
fasta=scan(file="Lecture11.fasta",what=character())
SequenceLength=data.frame(matrix(nrow=100,ncol=2))

#Load Sequence Lengths and GC content into datatable
for (i in 1:length(fasta)){
  if (grepl(">",fasta[i])==TRUE){
  }
  else {
    SequenceLength[i/2,1]=nchar(fasta[i])
    fasta[i]=gsub("A","",fasta[i])
    fasta[i]=gsub("A","",fasta[i])
    SequenceLength[i/2,2]=nchar(fasta[i])/SequenceLength[i/2,1]
  }
}

#Plot histograms
a=ggplot(data=SequenceLength,aes(x=SequenceLength[,1]))
a+geom_histogram()+theme_classic()+xlab("Sequence Length")

b=ggplot(data=SequenceLength,aes(x=SequenceLength[,2]))
b+geom_histogram()+theme_classic()+xlab("GC Content")

##############################The Second Part

CoffeeDeathTable=read.csv(file="CoffeeDeath.csv",header=FALSE,stringsAsFactors=FALSE)

c=ggplot(data=CoffeeDeathTable,aes(x=CoffeeDeathTable[,1],y=CoffeeDeathTable[,2]))
c+geom_point()+xlab('Amount of Coffee Consumed by the Average American (gallons)')+ylab('Number of people killed by misuing a nonpowered hand tool.')+geom_smooth(method=lm,se=FALSE)

##############################The Third Part

#Initialize the dataframe
data=read.table("data.txt", header = TRUE, sep = ",", stringsAsFactors = FALSE)

#Generate bar plot of the mean of populations for different regions
d = ggplot(data)
d + geom_bar(aes(x = as.factor(region), y = observations), stat = "summary",
             fun.y = "mean", fill = "black", color = "black") + theme_classic() +
  xlab("region") + ylab("population mean")

#creat a scatterplot of all observations using jitter function
d = ggplot(data, aes(region, observations))
d + geom_jitter(aes(x = "region", y = "observation", color = as.factor(region))) + xlab("region") + ylab("observations") +
  scale_color_manual(values = c("red", "green", "blue", "orange")) +
  theme(legend.title = element_blank())

#Remove the background grey and grid 
d + geom_jitter(aes(x = "region", y = "observation", color = as.factor(region))) + xlab("region") + ylab("observations") +
  scale_color_manual(values = c("red", "green", "blue", "orange")) +
  theme(legend.title = element_blank()) + coord_cartesian() + theme_classic()

#Yes,bar plot and scatter plots tell differnt stories - bar graph only shows the 
# mean of population per region while the scatter plot shows the observation 
# distribution in a region