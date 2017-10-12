
#Load ggplot2
library(ggplot2)
library(grid)
library(gridExtra)

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