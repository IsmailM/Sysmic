# Load libraries
library('ggplot2')

# you may need to install GGPLOT2 first as follows
# install.packages('ggplot2')

# Load the dataset
data(ChickWeight)

# check the data
str(ChickWeight)

##### Exercise 1.8.1 
### Question i)
# Subset data for chick 1
ChickWeight1 <- ChickWeight[ ChickWeight$Chick == 1 , ]
# Create Plot using GGPLOT2
ggplot(ChickWeight1) + geom_point(aes(x=Time, y=weight)) + geom_line(aes(x=Time, y=weight))

### Alternatively, Create Plot using Plot function
plot(x = ChickWeight1$Time, y = ChickWeight1$weight, xlab = 'Time', ylab = 'Weight') 
# Join the points
lines(ChickWeight1$Time, ChickWeight1$weight)
# Draw a single line through all the data (like the line of best fit)
abline(line(ChickWeight1$Time, ChickWeight1$weight), col="green")
# Use a different (but similiar) algorithm for the line of best fit
abline(lsfit(ChickWeight1$Time, ChickWeight1$weight), col="red")

### Question ii)
# Look at data
ChickWeight1

# get a vector of the vectors and get the first and last values
weight0 <- ChickWeight1$weight[1]
weight21 <- ChickWeight1$weight[12]

times_heavier <- weight21 / weight0
# 4.880952

### Question iii)

# Get the weights of all the chick Weights and use `which.max` to find the index of the maximum
idx <- which.max(ChickWeight$weight)
# Next use this index pull out this row from ChickWright
heaviestChickRow <- ChickWeight[idx,]
heaviestChick <- ChickWeight[idx,]$Chick
#35


### Question iv)
# Make histograms for the weights of the chicks on the four different diets after 21 days. Save them as PNG files. 
ChickWeight21Days = ChickWeight[ChickWeight$Time == 21,]
# my old attempt (was a bar plot and not a histogram)
# ggplot(ChickWeight21Days, aes(Diet, weight)) + geom_bar(stat="identity", position = "dodge", aes(fill=Chick), colour="black")
# ggplot(ChickWeight21Days, aes(Diet, weight)) + geom_bar(stat="identity")

ggplot(ChickWeight21Days) + geom_histogram(aes(weight, fill=Time), breaks=seq(50, 400, by = 50)) + facet_grid(. ~ Diet)

### Alternatively, use default plot command
# Try the original plot command we used for the scatterplot - see some interesting stuff (it automatically draw a boxplot)
plot(x = ChickWeight21Days$Diet, y = ChickWeight21Days$weight, )

# Subset the ChickWeight21Days further based on the diet
ChickWeight21Days_diet1 <- ChickWeight21Days[ChickWeight21Days$Diet == 1,]
ChickWeight21Days_diet2 <- ChickWeight21Days[ChickWeight21Days$Diet == 2,]
ChickWeight21Days_diet3 <- ChickWeight21Days[ChickWeight21Days$Diet == 3,]
ChickWeight21Days_diet4 <- ChickWeight21Days[ChickWeight21Days$Diet == 4,]

# Draw the histogram (and assign to a variable)
hist(x = ChickWeight21Days_diet1$weight, main="Histogram", xlab="Weight", ylab="Frequency")
hist(x = ChickWeight21Days_diet2$weight, main="Histogram", xlab="Weight", ylab="Frequency")
hist(x = ChickWeight21Days_diet3$weight, main="Histogram", xlab="Weight", ylab="Frequency")
hist(x = ChickWeight21Days_diet4$weight, main="Histogram", xlab="Weight", ylab="Frequency")

# lines(density(ChickWeight21Days_diet1$weight)) #plot a density curve 

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

