# Load the necessary libraries
install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)

# Read the data from the CSV file
data <- read_csv("paint_r.csv")

# Renaming the columns for clarity
colnames(data) <- c("Brand", "DryTime")

# One-way ANOVA
anova_result <- aov(DryTime ~ Brand, data = data)

# Summarize the ANOVA results
summary(anova_result)

# Extract the ANOVA table
anova_table <- anova(anova_result)

# Extract the mean squares
mean_sq_treatment <- anova_table[["Mean Sq"]][1]
mean_sq_error <- anova_table[["Mean Sq"]][2]

# Calculate the degrees of freedom
df_treatment <- anova_table[["Df"]][1]
df_error <- anova_table[["Df"]][2]

# Calculate the F-statistic
f_statistic <- mean_sq_treatment / mean_sq_error

# Calculate the p-value
p_value <- pf(f_statistic, df1 = df_treatment, df2 = df_error, lower.tail = FALSE)

# Output the requested values
cat("Sum of squares, treatment =", sum(anova_table[["Sum Sq"]])[1], "\n")
cat("Sum of squares, error =", sum(anova_table[["Sum Sq"]])[2], "\n")
cat("Mean squares, treatment =", mean_sq_treatment, "\n")
cat("Mean squares, error =", mean_sq_error, "\n")
cat("The value of the test statistics =", f_statistic, "\n")
cat("The p-value =", p_value, "\n")

# Determine whether to accept or reject the null hypothesis
alpha <- 0.05
if (p_value < alpha) {
  cat("The null hypothesis is rejected. The mean drying time of each brand of the robot is not the same.")
} else {
  cat("The null hypothesis is accepted. It means that the mean drying time of each brand of the robot is the same.")
}
