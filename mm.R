# Expected proportions
expected_proportions <- c(0.24, 0.13, 0.20, 0.16, 0.13, 0.14)

# Observed counts from your sample
observed_counts <- c(105, 72, 89, 84, 70, 80)

# Calculate the expected counts
total_sample_size <- sum(observed_counts)
expected_counts <- total_sample_size * expected_proportions

# Perform the chi-squared test
chi_squared_test <- chisq.test(observed_counts, p = expected_proportions)

# Extract the p-value
p_value <- chi_squared_test$p.value

# Set the significance level
alpha <- 0.05

# Create a data frame for the chi-squared test
data_for_chisq <- data.frame(
  Observed = observed_counts,
  Historical = expected_proportions * total_sample_size,
  Test_Proportion = expected_proportions,
  Expected = expected_counts,
  Contribution_to_ChiSquare = ((observed_counts - expected_counts)^2) / expected_counts
)

# Print the table with data and contributions to Chi-Square
print(data_for_chisq)

# Print N, DF, Chi-Square, and p-value
cat("N:", total_sample_size, "\n")
cat("DF:", length(expected_proportions) - 1, "\n")
cat("Chi-Square:", chi_squared_test$statistic, "\n")
cat("p-value:", p_value, "\n")

# Make a conclusion
if (p_value < alpha) {
  cat("Reject the null hypothesis. The proportions are different from the expected proportions.")
} else {
  cat("Fail to reject the null hypothesis. The proportions are not significantly different from the expected proportions.")
}
