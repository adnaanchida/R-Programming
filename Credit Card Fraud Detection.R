# Load necessary libraries
library(dplyr)
library(caret)
library(randomForest)

# Load the dataset (adjust the path as needed)
data <- read.csv("creditcard.csv")

# Explore the data
str(data)
summary(data)

# Split the data into training and testing sets (70% training, 30% testing)
set.seed(123)
train_index <- createDataPartition(data$Class, p = 0.7, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Train a random forest classifier
model <- randomForest(Class ~ ., data = train_data, ntree = 100)

# Predict on the test data
predictions <- predict(model, newdata = test_data)

# Evaluate the model
confusion_matrix <- confusionMatrix(predictions, test_data$Class)
print(confusion_matrix)
