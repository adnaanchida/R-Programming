# Read the data
data <- read.csv("racingbicycles_r.csv")

# View the structure of the dataset
str(data)

# Perform linear regression
model <- lm(Price ~ Weight, data = data)

# View the summary of the regression model
summary(model)
