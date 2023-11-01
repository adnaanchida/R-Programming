# Load necessary libraries
library(ggplot2)

# Read the data
data <- read.csv("wineprices_r.csv")

# View the structure of the dataset
str(data)

# Step 2: Create a Scatterplot
ggplot(data, aes(x = Age, y = Price)) +
  geom_point() +
  labs(title = "Scatterplot of Wine Price by Age",
       x = "Age of Wine",
       y = "Price of Wine")

# Step 3: Perform Linear Regression
model <- lm(Price ~ Age, data = data)

# Get the summary of the regression model
summary(model)

# Interpretation of the slope of the estimated equation
coefficients(model)
