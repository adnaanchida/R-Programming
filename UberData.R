# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the Uber data
uber_data <- read.csv("uber_data.csv")

# Summary statistics
summary(uber_data)

# Average fare
avg_fare <- mean(uber_data$Fare)
cat("Average Fare: $", round(avg_fare, 2), "\n")

# Total distance traveled
total_distance <- sum(uber_data$Distance)
cat("Total Distance Traveled: ", total_distance, " miles\n")

# Create a histogram of fare amounts
ggplot(uber_data, aes(x = Fare)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Histogram of Fare Amounts", x = "Fare Amount ($)") +
  theme_minimal()

# Calculate and display correlations
correlations <- cor(uber_data[, c("Distance", "Fare", "Rider_Rating", "Driver_Rating")])
print("Correlation Matrix:")
print(correlations)

# Create a scatter plot of distance vs. fare
ggplot(uber_data, aes(x = Distance, y = Fare)) +
  geom_point() +
  labs(title = "Scatter Plot of Distance vs. Fare",
       x = "Distance (miles)", y = "Fare Amount ($)") +
  theme_minimal()
