# If needed, install the required package
install.packages("mlbench")


# Load the dataset
library(mlbench)
data(BreastCancer)
breast_cancer_data <- BreastCancer[, -1]  # Remove the ID column
breast_cancer_data <- na.omit(breast_cancer_data)  # Handle missing values

# Convert response variable to factor
breast_cancer_data$Class <- factor(breast_cancer_data$Class, levels = c("benign", "malignant"))


# Set seed for reproducibility
set.seed(123)

# Split into training (70%) and test (30%) sets
sample_index <- sample(seq_len(nrow(breast_cancer_data)), size = 0.7 * nrow(breast_cancer_data))
train_data <- breast_cancer_data[sample_index, ]
test_data <- breast_cancer_data[-sample_index, ]


# Load the class package for knn
library(class)

# Set predictor variables and response for training and testing
train_X <- train_data[, -ncol(train_data)]
test_X <- test_data[, -ncol(test_data)]
train_y <- train_data$Class
test_y <- test_data$Class

# Implement KNN with k = 5
knn_pred <- knn(train = train_X, test = test_X, cl = train_y, k = 5)


# Confusion matrix
confusion_matrix <- table(Predicted = knn_pred, Actual = test_y)
confusion_matrix

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
accuracy * 100


# Find optimal k by checking accuracy for different k values
accuracy_k <- sapply(1:20, function(k) {
  knn_pred <- knn(train = train_X, test = test_X, cl = train_y, k = k)
  sum(diag(table(Predicted = knn_pred, Actual = test_y))) / length(test_y)
})

plot(1:20, accuracy_k, type = "b", xlab = "Number of Neighbors (k)", ylab = "Accuracy")


