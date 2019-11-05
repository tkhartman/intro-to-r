## Intro to R
4 + 5 # do some maths
3 - 1 # this is wrong

####  Practical 1  ####

## Question 1 
## Load the turnout data
turnout <- read.csv("turnout.csv")
df <- read.csv("turnout.csv")  # Store as different object
rm(df)

## Get summary statistics
summary(turnout)  # For the entire dataset

summary(turnout$ANES)  # For a single variable
summary(turnout$total)

## Get a frequency table for the year variable
table(turnout$year)

## Question 2
## Create a new variable (turnout rate)
turnout$VAP.tr <- turnout$total / 
  (turnout$VAP + turnout$overseas) * 100

summary(turnout$VAP.tr)

turnout$VEP.tr <- turnout$total / 
  (turnout$VEP + turnout$overseas) * 100
summary(turnout$VEP.tr)

## Question 3
turnout$VAP.diff <- turnout$ANES - turnout$VAP.tr
summary(turnout$VAP.diff)

turnout$VEP.diff <- turnout$ANES - turnout$VEP.tr
summary(turnout$VEP.diff)

## Question 4
turnout.pres <- subset(turnout, 
                       year == "1980" | 
                         year == "1984" |
                         year == "1988" |
                         year == "1992" |
                         year == "1996" |
                         year == "2000" |
                         year == "2004" |
                         year == "2008")
summary(turnout.pres$VEP.diff)
hist(turnout.pres$VEP.diff)


## Installing packages
install.packages("haven")
library("haven")

## Import a Stata dataset
census <- read_dta("census.dta")

lm(ANES ~ VEP.tr, data = turnout)  # regression (linear model function)

## Export your new turnout data with variables
write.csv(turnout, "newturnout.csv")
