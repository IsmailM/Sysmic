library('ggplot2')
data(ChickWeight)

##### Exercise 1.8.1 
### Question i)
ChickWeight1 <- ChickWeight[ ChickWeight$Chick == 1 , ]
ggplot(ChickWeight1, aes(x=Time, y=weight)) + geom_smooth() + geom_point() 
ggsave('Assignment/scatter.png')

### Question ii)
weight_21 <- ChickWeight1[ChickWeight1$Time == 21,]$weight
weight_0 <- ChickWeight1[ChickWeight1$Time == 0,]$weight
weight_21 / weight_0
# 4.880952

### Question iii)
idx <- which.max(ChickWeight$weight)
ChickWeight[idx,]$Chick
#35

### Question iv)
ChickWeight21Days = ChickWeight[ChickWeight$Time == 21,]
ggplot(ChickWeight21Days, aes(weight)) + geom_histogram(breaks=seq(50,400,50)) + facet_grid(. ~Diet )
ggsave('Assignment/histogram.png')

###Question v)
aggregate(ChickWeight21Days$weight, list(ChickWeight21Days$Diet), mean)
#   Group.1        x
# 1       1 177.7500
# 2       2 214.7000
# 3       3 270.3000
# 4       4 238.5556

aggregate(ChickWeight21Days$weight, list(ChickWeight21Days$Diet), sd)
#   Group.1        x
# 1       1 58.70207
# 2       2 78.13813
# 3       3 71.62254
# 4       4 43.34775
ggplot(ChickWeight21Days) + geom_boxplot(aes(Diet, weight))
ggsave('Assignment/boxplot.png')
