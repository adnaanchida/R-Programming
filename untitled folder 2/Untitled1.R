# Load the data
data <- read.csv("passingnfl_r.csv")

# Fit a linear regression model using only average passing yards per attempt
model1 <- lm(Win ~ Yds_Att, data = data)

# Summarize the model
summary(model1)

# Add ANOVA table
anova_table <- anova(model1)
print(anova_table)

# Fit a multiple linear regression model
model <- lm(Win ~ Yds_Att + Int_Att, data = data)

# Summarize the model
summary(model)



