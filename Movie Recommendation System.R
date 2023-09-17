# Install and load the recommenderlab library
install.packages("recommenderlab")
library(recommenderlab)

# Sample movie ratings data (user, movie, rating)
ratings_data <- data.frame(
  user = c("User1", "User1", "User2", "User2", "User3", "User3"),
  movie = c("Movie1", "Movie2", "Movie2", "Movie3", "Movie3", "Movie4"),
  rating = c(4, 3, 5, 4, 2, 1)
)

# Create a recommender system object
rating_matrix <- as(ratings_data, "realRatingMatrix")
recommender <- Recommender(rating_matrix, method = "UBCF")

# Generate recommendations for a specific user
user_to_recommend <- rating_matrix$ncol
user_recommendations <- predict(recommender, n = 3, newUsers = user_to_recommend)
user_recommendations
