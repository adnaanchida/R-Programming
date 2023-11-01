# Create a data frame with the provided data
data <- data.frame(
    City = c("Boston", "Denver", "Nashville", "New Orleans", "Phoenix", "San Diego", "San Francisco", "San Jose", "Tampa"),
    Room_Rate = c(148, 96, 91, 110, 90, 102, 136, 90, 82),
    Entertainment = c(161, 105, 101, 142, 100, 120, 167, 140, 98)
)

# data <- read.csv("businesstravel_r.csv")


# Perform Linear Regression
model <- lm(Entertainment ~ Room_Rate, data = data)

# View the summary of the regression model
summary(model)

# Calculate predictions and intervals
prediction_89 <- predict(model, newdata = data.frame(Room_Rate = 89), interval = "confidence")
prediction_chicago <- predict(model, newdata = data.frame(Room_Rate = 128), interval = "prediction")

# Display the results in the desired format
cat("Predicted values for: Entertainment\n")
cat("95% Confidence Interval\n")
cat("Room Rate\tPredicted\tlower\tupper\n")
cat("89\t", round(prediction_89[1], 2), "\t", round(prediction_89[2], 2), "\t", round(prediction_89[3], 2), "\n")

cat("\n95% Prediction Interval\n")
cat("Room Rate\tPredicted\tlower\tupper\n")
cat("128\t", round(prediction_chicago[1], 2), "\t", round(prediction_chicago[2], 2), "\t", round(prediction_chicago[3], 2), "\n")
