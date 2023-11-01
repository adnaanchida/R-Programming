# Load the required libraries
library(readr)
library(ggplot2)
library(lmtest)

# Load the data
data <- read_csv("nflpassing_r.csv")

# a. Develop a scatter diagram
ggplot(data, aes(x = Yds, y = Win)) +
  geom_point() +
  labs(x = "Average Passing Yards per Attempt (Yds)", y = "Percentage of Games Won (Win)") +
  ggtitle("Scatter Diagram")

# b. Interpret the scatter diagram

# The scatter diagram visually shows the relationship between Yds and Win.

# c. Develop the estimated regression equation
model <- lm(Win ~ Yds, data = data)
summary(model)

# d. Interpretation of the slope

# The coefficient for Yds in the model summary represents the slope. 

# It indicates how much Win is expected to change for each one-unit increase in Yds.

# e. Predict the percentage of games won by the Kansas City Chiefs
Yds_kc_chiefs <- 6.2
predicted_win_kc_chiefs <- predict(model, newdata = data.frame(Yds = Yds_kc_chiefs))
cat("Predicted Percentage of Games Won by Kansas City Chiefs:", predicted_win_kc_chiefs, "\n")

# Actual Percentage of Games Won by the Kansas City Chiefs in 2011
actual_win_kc_chiefs <- 7 / (7 + 9)  # 7 wins and 9 losses
cat("Actual Percentage of Games Won by Kansas City Chiefs:", actual_win_kc_chiefs, "\n")