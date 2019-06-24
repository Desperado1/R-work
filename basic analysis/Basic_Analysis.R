# setting the wokring directory
setwd("C:/Users/himanshu/Desktop/R analysis")
mydata <- read.csv("mroz.csv", na.string = ".")

# summary stats for all the variables in the dataset
summary(mydata)
cor(mydata)


# dealing with missing values
cor(mydata[c("educ","wage")])
cor(mydata[c("educ","wage")], use = "complete") #unuse those observation

# summary stat for selected variables
## option 1
summary(mydata[c("hours", "husage")])


## option 2
mydata.sub0 <- subset(mydata, select = c("hours", "husage"))
summary(mydata.sub0)
cor(mydata.sub0)


#using subsets of data
mydata.sub1 <- subset(mydata, hours > 0 )
cor(mydata.sub1[c("educ", "wage")])

mydata.sub1 <- subset(mydata, hours > 0, select = c("educ", "wage"))


# More summary stats
## Categorical Varialbes
install.packages("mosaic")
require(mosaic) # for tally function
tally(~kidslt6, data = mydata, margins = TRUE)
tally(~kidslt6, data = mydata, margins = TRUE, format = "perc")
tally(~kidslt6, data = mydata, margins = TRUE, format = "prop")

## Contingency Tables
tally(~kidsge6+kidslt6, data = mydata, margins = TRUE)

## Conditional Tables
tally(~kidsge6|educ>=16, data = mydata, margin = TRUE, format = "prop")


## Continuous Variables
mean(~wage, data = mydata, na.rm = TRUE)

favstats(~wage, data = mydata)
favstats(~educ, data = mydata)

mydata.sub2 <- subset(mydata, select = c("hours", "husage", "wage", "huswage"))
dfapply(mydata.sub2, favstats)
