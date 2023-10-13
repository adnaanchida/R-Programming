# Load the necessary libraries
library(readr)
library(dplyr)

# Load the data
data <- read_csv("socialmedia_r.csv")

# Convert "Yes" to 1 and "No" to 0
data$Use_Social_Media <- ifelse(data$Use_Social_Media == "Yes", 1, 0)

# Group the data by country and calculate the sample proportions
sample_proportions <- data %>%
  group_by(Country) %>%
  summarize(Proportion = mean(Use_Social_Media))

# Find the country with the largest proportion of adults using social media
largest_proportion_country <- sample_proportions %>%
  filter(Proportion == max(Proportion))

# Display the sample proportions and the country with the largest proportion
print(sample_proportions)
print(largest_proportion_country)
