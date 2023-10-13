#read data into data frame
auto_loyalty_df <- read.csv("autoloyalty_r.csv")

#create data frame with only Impala observations
impala_df <- subset(auto_loyalty_df,Automobile=="Chevrolet Impala")

#remove rows with missing values 
impala_df <- na.omit(impala_df)

#create data frame with only Impala observations with "Yes" responses
yes_impala <- subset(impala_df,Likely.Repurchase=="Yes")

#calculate the number of Yes responses in Impala observations
num_yes_impala <- nrow(yes_impala)

#create data frame with only Impala observations with "No" responses
no_impala <- subset(impala_df,Likely.Repurchase=="No")

#calculate the number of No responses in Impala observations
num_no_impala <- nrow(no_impala)

#calculate total number of Impala observations
samp_size_impala <- num_yes_impala + num_no_impala

#repeat procedure for Fusion observations
fusion_df <- subset(auto_loyalty_df,Automobile=="Ford Fusion")
fusion_df <- na.omit(fusion_df)
yes_fusion <- subset(fusion_df,Likely.Repurchase=="Yes")
num_yes_fusion <- nrow(yes_fusion)
no_fusion <- subset(fusion_df,Likely.Repurchase=="No")
num_no_fusion <- nrow(no_fusion)
samp_size_fusion <- num_yes_fusion+num_no_fusion

#repeat procedure for Accord observations
accord_df <- subset(auto_loyalty_df,Automobile=="Honda Accord")
accord_df <- na.omit(accord_df)
yes_accord <- subset(accord_df,Likely.Repurchase=="Yes")
num_yes_accord <- nrow(yes_accord)
no_accord <- subset(accord_df,Likely.Repurchase=="No")
num_no_accord <- nrow(no_accord)
samp_size_accord <- num_yes_accord +num_no_accord

#perform hypothesis test on equality of proportions
test <- prop.test(c(num_yes_impala,num_yes_fusion,num_yes_accord),c(samp_size_impala,samp_size_fusion,samp_size_accord),correct=FALSE)

#list results of hypothesis test
list(test)