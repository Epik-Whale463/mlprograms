# Install and load the ISLR package
install.packages("ISLR")
library(ISLR)

data("Smarket")


# View structure and summary of the data
str(Smarket)
summary(Smarket)


# Split the data
train <- Smarket$Year < 2005
train_data <- Smarket[train, ]
test_data <- Smarket[!train, ]
test_y <- test_data$Direction



# Load the MASS package for LDA
library(MASS)

# Fit LDA model on training data
lda_fit <- lda(Direction ~ Lag1 + Lag2, data = train_data)
lda_pred <- predict(lda_fit, test_data)

# Confusion matrix and accuracy for LDA
lda_cm <- table(Predicted = lda_pred$class, Actual = test_y)
lda_accuracy <- sum(diag(lda_cm)) / sum(lda_cm)
lda_cm
lda_accuracy *100




# Fit QDA model on training data
qda_fit <- qda(Direction ~ Lag1 + Lag2, data = train_data)
qda_pred <- predict(qda_fit, test_data)

# Confusion matrix and accuracy for QDA
qda_cm <- table(Predicted = qda_pred$class, Actual = test_y)
qda_accuracy <- sum(diag(qda_cm)) / sum(qda_cm)
qda_cm
qda_accuracy * 100


# Install and load the e1071 package
install.packages("e1071")
library(e1071)

# Fit Naive Bayes model on training data
nb_fit <- naiveBayes(Direction ~ Lag1 + Lag2, data = train_data)
nb_pred <- predict(nb_fit, test_data)

# Confusion matrix and accuracy for Naive Bayes
nb_cm <- table(Predicted = nb_pred, Actual = test_y)
nb_accuracy <- sum(diag(nb_cm)) / sum(nb_cm)
nb_cm
nb_accuracy * 100


# Comparison of accuracies
accuracy_results <- data.frame(
  Model = c("LDA", "QDA", "Naive Bayes"),
  Accuracy = c(lda_accuracy, qda_accuracy, nb_accuracy) * 100
)
accuracy_results

