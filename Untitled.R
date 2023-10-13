# Load the necessary libraries
library(readr)
library(dplyr)

# Load the data
data <- read_csv("socialmedia_r.csv")

# Make sure the column names are correct

# Create a contingency table
contingency_table <- table(data$Country, data$Use_Social_Media)

# Perform the chi-squared test
chi_squared_test <- chisq.test(contingency_table)

# Display the test results
print(chi_squared_test)

# Extract the p-value
p_value <- chi_squared_test$p.value

# Set the significance level
alpha <- 0.05

# Make a conclusion
if (p_value < alpha) {
  cat("Reject the null hypothesis. There is an association between the country and the proportion of adults using social media.")
} else {
  cat("Fail to reject the null hypothesis. There is no significant association between the country and the proportion of adults using social media.")
}

