# Install tidyverse if not already installed
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}

# Load necessary libraries
library(tidyverse)

# Read the data from the CSV file
nfl_data <- read.csv("passingnfl_r.csv")

# Check the column names
colnames(nfl_data)

# Part (a): Regression equation for Win% vs Yds/Att
model_yds_att <- lm(Win ~ Yds_Att, data = nfl_data)
summary(model_yds_att)

# Part (b): Regression equation for Win% vs Int/Att
model_int_att <- lm(Win ~ Int_Att, data = nfl_data)
summary(model_int_att)

# Part (c): Regression equation for Win% vs Yds/Att and Int/Att
model_combined <- lm(Win ~ Yds_Att + Int_Att, data = nfl_data)
summary(model_combined)

# Part (d): Predict the Win% for the Kansas City Chiefs
kansas_city_chiefs <- data.frame(Yds_Att = 6.2, Int_Att = 0.036)
prediction <- predict(model_combined, newdata = kansas_city_chiefs)

# Print the prediction
cat("Predicted Win% for the Kansas City Chiefs:", prediction, "\n")


# Compare with actual Win% (assuming 7 wins and 9 losses)
actual_win_percentage <- 7 / (7 + 9)
cat("Actual Win% for the Kansas City Chiefs:", actual_win_percentage, "\n")

# Compare the prediction with actual Win%
cat("Comparison:")
if (prediction > actual_win_percentage) {
  cat("The predicted Win% is higher than the actual Win%\n")
} else if (prediction < actual_win_percentage) {
  cat("The predicted Win% is lower than the actual Win%\n")
} else {
  cat("The predicted Win% is equal to the actual Win%\n")
}