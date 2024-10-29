install.packages("ISLR")
library(ISLR)

auto_data = Auto
head(auto_data)


auto_data <- na.omit(auto_data)  # Remove rows with missing values


# Simple linear regression with mpg as the response and horsepower as the predictor
lm_fit <- lm(mpg ~ horsepower, data = auto_data)


# Display the regression summary
summary(lm_fit)



# Prediction for horsepower = 98
predicted_mpg <- predict(lm_fit, data.frame(horsepower = 98), interval = "confidence")
prediction_interval <- predict(lm_fit, data.frame(horsepower = 98), interval = "prediction")

predicted_mpg
prediction_interval


# Scatter plot with regression line
plot(auto_data$horsepower, auto_data$mpg, main = "MPG vs Horsepower",
     xlab = "Horsepower", ylab = "MPG", col = "blue", pch = 20)
abline(lm_fit, col = "red", lwd = 2)


# Diagnostic plots
par(mfrow = c(2, 2))  # Arrange plots in a 2x2 grid
plot(lm_fit)

