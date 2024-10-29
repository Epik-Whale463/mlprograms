# Install and load ISLR package if not installed
install.packages("ISLR")
library(ISLR)

data("Khan")


# Check the structure and dimensions of the data
str(Khan)
dim(Khan$xtrain)
dim(Khan$xtest)


# Prepare the data
train_data <- data.frame(Khan$xtrain)
train_data$Class <- as.factor(Khan$ytrain)

test_data <- data.frame(Khan$xtest)
test_data$Class <- as.factor(Khan$ytest)


# Install and load e1071 package for SVM
install.packages("e1071")
library(e1071)

# Fit an SVM model on the training data
svm_model <- svm(Class ~ ., data = train_data, kernel = "linear", cost = 10, scale = FALSE)
summary(svm_model)


# Predict on test data
svm_pred <- predict(svm_model, test_data)

# Confusion matrix and accuracy
confusion_matrix <- table(Predicted = svm_pred, Actual = test_data$Class)
confusion_matrix
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
accuracy * 100



# SVM with radial kernel
svm_model_radial <- svm(Class ~ ., data = train_data, kernel = "radial", cost = 10, gamma = 0.1)
svm_pred_radial <- predict(svm_model_radial, test_data)

# Confusion matrix and accuracy for radial kernel
confusion_matrix_radial <- table(Predicted = svm_pred_radial, Actual = test_data$Class)
confusion_matrix_radial
accuracy_radial <- sum(diag(confusion_matrix_radial)) / sum(confusion_matrix_radial)
accuracy_radial * 100



