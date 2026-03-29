## LSE Data Analytics Online Career Accelerator 
# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Import necessary libraries

library(openxlsx)
library(dplyr)
library(ggplot2)
library(moments)
library(corrplot)

# Import CSV data
tr <- read.csv("C:/Users/alext/Course 3 Assignment/turtle_reviews.csv")

# Check that tr is successfully imported
class(tr)
dim(tr)

# Head of dataframe
head(tr)

# Summary statistics 
summary(tr)

# Check for null values
colSums(is.na(tr))

# Check data types
column_data_types <- sapply(tr, class)
print(column_data_types)

# Rename remuneration and spending score
tr <- tr %>%
  rename(
    remuneration = remuneration..k..,
    spending_score = spending_score..1.100.
  )

# Drop columns not required for EDA
tr <- tr %>%
  select(-review, -summary, -platform, -language)

# View Dataframe
head(tr)

# Save new cleaned CSV
write.csv(
  tr,
  "C:/Users/alext/Course 3 Assignment/turtle_reviews_rcleaned.csv",
  row.names = FALSE
)

# Exploratory Data Analysis
# Focussing on loyalty_points
summary(tr$loyalty_points)
skewness(tr$loyalty_points)
kurtosis(tr$loyalty_points)

# Visualising loyalty point distribution with a histogram
ggplot(tr, aes(x = loyalty_points)) +
  geom_histogram(
    bins = 30,
    fill = "blue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Loyalty Points",
    x = "Loyalty Points",
    y = "Count"
  )

# Boxplot of loyalty points 
ggplot(tr, aes(y = loyalty_points)) +
  geom_boxplot() +
  labs(
    title = "Boxplot of Loyalty Points",
    y = "Loyalty Points"
  )

# Observations:
# The skewness value indicates a moderate to strong right-skewed distribution.
# Most customers have relatively few loyalty points, while a small number of
# customers hold very high loyalty point totals.
#
# The kurtosis value is greater than 3, indicating a leptokurtic distribution.
# This suggests heavier tails and the presence of more extreme outliers.
#
# These observations are consistent with the histogram and boxplot, which show
# a much higher concentration of customers at lower loyalty point values. The
# boxplot in particular highlights that the third quartile lies below 2000,
# while there are values extending above 6000, indicating the presence of
# high-end outliers.

# Exploring loyalty points with categorical variables using grouping

# Create a table summarising loyalty points by gender
gender_summary <- tr %>%
  group_by(gender) %>%
  summarise(
    count = n(),
    mean_loyalty = mean(loyalty_points, na.rm = TRUE),
    median_loyalty = median(loyalty_points, na.rm = TRUE),
    min_loyalty = min(loyalty_points, na.rm = TRUE),
    max_loyalty = max(loyalty_points, na.rm = TRUE)
  )

# Show output
gender_summary

# Create table for presentations
# (commented out to avoid file path issues on other machines)
# write.csv(
#   gender_summary,
#   "C:/Users/alext/Course 3 Assignment/gender_loyalty_summary.csv",
#   row.names = FALSE
# )

# Create a table summarising loyalty points by education level
education_summary <- tr %>%
  group_by(education) %>%
  summarise(
    count = n(),
    mean_loyalty = mean(loyalty_points, na.rm = TRUE),
    median_loyalty = median(loyalty_points, na.rm = TRUE),
    min_loyalty = min(loyalty_points, na.rm = TRUE),
    max_loyalty = max(loyalty_points, na.rm = TRUE)
  )

# Show output
education_summary

# Create table for presentations
# (commented out to avoid file path issues on other machines)
# write.csv(
#   education_summary,
#   "C:/Users/alext/Course 3 Assignment/education_loyalty_summary.csv",
#   row.names = FALSE
# )

# Create age groups
tr <- tr %>%
  mutate(
    age_group = cut(
      age,
      breaks = c(0, 25, 35, 45, 55, Inf),
      labels = c("U25", "25–34", "35–44", "45-54", "55+")
    )
  )

# Create a table summarising loyalty points by age group
age_group_summary <- tr %>%
  group_by(age_group) %>%
  summarise(
    count = n(),
    mean_loyalty = mean(loyalty_points, na.rm = TRUE),
    median_loyalty = median(loyalty_points, na.rm = TRUE),
    min_loyalty = min(loyalty_points, na.rm = TRUE),
    max_loyalty = max(loyalty_points, na.rm = TRUE)
  )

# Show output
age_group_summary

# Create table for presentations
# (commented out to avoid file path issues on other machines)
# write.csv(
#   age_group_summary,
#   "C:/Users/alext/Course 3 Assignment/age_group_loyalty_summary.csv",
#   row.names = FALSE
# )

# Grouping Observations:
#
# Gender appears to have minimal impact on loyalty point accumulation.
# Mean loyalty points are similar for female (1601) and male (1549) customers,
# with comparable median values (1281 and 1248 respectively), suggesting broadly
# similar engagement levels across genders.
#
# In terms of education, graduates represent the largest demographic group,
# accounting for approximately 45% of customers (900 out of 2000). Mean loyalty
# points for customers with PhD, diploma, graduate, and postgraduate education
# levels are all close to the overall mean (1578), ranging from 1336 to 1666.
# Notably, customers with basic education exhibit a higher mean loyalty point
# balance (2265), however, this education group has a much smaller population
# at just 50 of 2000.
#
# Age appears to show clearer differences in loyalty point accumulation.
# Customers under 25 have noticeably lower mean loyalty points (893) compared
# with other age groups. The 25–34 age group shows a substantially higher mean
# loyalty point balance (2107), exceeding the overall average, while customers
# aged 55 and over have a lower mean (1168), though still higher than the
# youngest cohort.

# Creating scatter plots for spending score and remuneration

# Scatterplot for spending score against loyalty points
ggplot(tr, aes(x = spending_score, y = loyalty_points)) +
  geom_point(color = "blue") +
  labs(
    title = "Loyalty Points vs Spending Score",
    x = "Spending Score",
    y = "Loyalty Points"
  )

# Scatterplot for remuneration against loyalty points
ggplot(tr, aes(x = remuneration, y = loyalty_points)) +
  geom_point(color = "blue") +
  labs(
    title = "Loyalty Points vs Remuneration",
    x = "Remuneration",
    y = "Loyalty Points"
  )

# Regression modelling

# Feature Selection:
# Based on the findings from the exploratory data analysis in R, together with
# prior modelling work conducted in Python, spending_score and remuneration
# were selected as the primary numeric predictors of loyalty points.
#
# Age was also included in the model, despite earlier Python-based modelling
# indicating a weaker relationship, in order to formally assess its contribution
# within a multiple linear regression framework.
#
# Categorical variables were excluded from this regression analysis, as they
# would require additional encoding. Furthermore, earlier exploratory analysis
# suggested limited variance in loyalty point accumulation across most
# categorical groupings.

# Check original Dataframe
head(tr)

# Drop unnecessary columns for correlation analysis
tr_numeric <- tr %>%
  select_if(is.numeric) %>%
  select(-product)

# View dataframe
head(tr_numeric)

# Calculate the correlation matrix
# No null values in current dataset but complete.obs kept for future data
correlation_matrix <- cor(tr_numeric, use = "complete.obs")

# View the correlation matrix
correlation_matrix

# Correlation plot
corrplot(correlation_matrix, method = "circle")

# Round correlation matrix to 3 decimal places for presentation
correlation_matrix_rounded <- round(correlation_matrix, 3)

# View rounded matrix
correlation_matrix_rounded

# Save rounded correlation matrix for presentation purposes
# (commented out to avoid file path issues on other machines)
# write.csv(
#   correlation_matrix_rounded,
#   "C:/Users/alext/Course 3 Assignment/correlation_matrix.csv",
#   row.names = TRUE
# )

# Observations:
# Loyalty points show the strongest positive correlation with spending score,
# followed by a moderate positive correlation with remuneration. Age exhibits
# only a very weak linear relationship with loyalty points.
#
# Correlations among the predictor variables themselves are low to moderate,
# indicating no need for concerns about multicollinearity.

# Create the model
lp_model <- lm(
  loyalty_points ~ spending_score + remuneration + age,
  data = tr_numeric
)

# Summarize the model
summary(lp_model)

# Create table of coefficients for readability in report
# Extract regression coefficients table
coefficients_table <- as.data.frame(summary(lp_model)$coefficients)
coefficients_table$Variable <- rownames(coefficients_table)
coefficients_table <- coefficients_table[, c("Variable", names(coefficients_table)[1:4])]
coefficients_table[, -1] <- round(coefficients_table[, -1], 3)

# View Dataframe
coefficients_table

# Save rounded coefficients table for technical report
# (commented out to avoid file creation on other machines)
# write.csv(
#   coefficients_table,
#   "C:/Users/alext/Course 3 Assignment/coefficient_table.csv",
#   row.names = FALSE
# )

# Observation and comparison with Python regression modelling:
# In Python, loyalty points were modelled against age exclusively, where age
# was not statistically significant and explained very little variance in
# loyalty point accumulation. However, in the multiple linear regression model
# used here, age becomes statistically significant once spending score and
# remuneration are controlled for.
#
# Despite this statistical significance, the effect size for age remains very
# small, indicating that its role in explaining loyalty point accumulation is
# secondary and likely indirect.
#
# Spending score and remuneration are also statistically significant and act as
# strong drivers of loyalty point accumulation. This is consistent with the
# findings from the Python regression analysis.

# Model goodness-of-fit metrics
model_fit <- data.frame(
  R_sq = summary(lp_model)$r.squared,
  Adj_R_sq = summary(lp_model)$adj.r.squared,
  Res_Std_Error = summary(lp_model)$sigma,
  F_stat = summary(lp_model)$fstatistic[1],
  F_p_value = pf(
    summary(lp_model)$fstatistic[1],
    summary(lp_model)$fstatistic[2],
    summary(lp_model)$fstatistic[3],
    lower.tail = FALSE
  )
)
model_fit <- round(model_fit, 3)

# View Dataframe
model_fit

# Save model fit table for technical report
# (commented out to avoid file creation on other machines)
# write.csv(
#   model_fit,
#   "C:/Users/alext/Course 3 Assignment/mlr_model_fit.csv",
#   row.names = FALSE
# )

# Goodness-of-Fit:
# The regression model demonstrates strong explanatory power, with an R-squared
# value of approximately 0.84. This suggests that spending score and
# remuneration together explain a large proportion of the variance in loyalty
# point accumulation.
#
# This appears logical, as it is reasonable to assume that customers with
# higher disposable income and greater spending habits would earn more loyalty
# points.
#
# The residual standard error is relatively high at approximately 513,
# indicating that actual loyalty point values may vary from model predictions.
# This is expected given the inherent variability in individual customer
# behaviour.
#
# The F-test p-value is close to zero, indicating that the model is 
# statistically significant overall and provides a better fit than an 
# intercept-only model.

# Generating and plotting predictions

# Generate predicted loyalty values for the dataset
tr_numeric$predicted_loyalty <- predict(lp_model)

# View DataFrame
head(tr_numeric)

# Observation
# As the model is uncontstrained, negative values for loyalty points may be
# predicted. This is expected behaviour for linear models and should be 
# interpreted in a practical sense as very low to zero expected loyalty points 
# for that customer.

# Plot actual vs predicted loyalty points
ggplot(tr_numeric, aes(x = loyalty_points, y = predicted_loyalty)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_abline(intercept = 0, slope = 1, color = "red") +
  labs(
    title = "Actual vs Predicted Loyalty Points",
    x = "Actual Loyalty Points",
    y = "Predicted Loyalty Points"
  )

# Observation:
# Predicted loyalty points closely track observed values overall. Greater
# variance and dispersion are observed at the extremities of the distribution.
# For example, while actual loyalty points cannot fall below zero, the model
# produces negative predicted values at low levels of observed loyalty



###############################################################################





