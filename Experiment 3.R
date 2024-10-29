# Load the Auto dataset and handle missing values
auto_data <- na.omit(auto_data)

# Scatterplot matrix of all quantitative variables
pairs(auto_data[, -which(names(auto_data) == "name")])


# Compute correlation matrix for numerical variables
cor(auto_data[, sapply(auto_data, is.numeric)])


# Multiple linear regression model
mlr_fit <- lm(mpg ~ . - name, data = auto_data)

# Display model summary
summary(mlr_fit)


# Diagnostic plots for the multiple regression model
par(mfrow = c(2, 2))
plot(mlr_fit)


# Model with interaction terms between predictors
interaction_fit <- lm(mpg ~ horsepower * weight + displacement * year, data = auto_data)
summary(interaction_fit)

# Model with transformed variables
transformation_fit <- lm(mpg ~ log(horsepower) + sqrt(weight) + I(displacement^2), data = auto_data)
summary(transformation_fit)

