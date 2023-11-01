# Load necessary libraries
library(ggplot2)

# Read the data
data <- read.csv("gpasalary_r.csv")

# View the structure of the dataset
str(data)

# Create a scatterplot
ggplot(data, aes(x = GPA, y = Salary)) +
  geom_point() +
  labs(title = "Scatterplot of College GPA vs. Salary 10 Years After Graduation",
       x = "College GPA",
       y = "Salary 10 Years After Graduation")

# Perform linear regression
model <- lm(Salary ~ GPA, data = data)

# View the summary of the regression model
summary(model)

# F-test for significance
anova(model)
