rm(list=ls())

#Load ggplot
library(ggplot2)
library(grid)
library(gridExtra)

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