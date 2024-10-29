# Install and load the ISLR package if not already installed
install.packages("ISLR")
library(ISLR)

data("Carseats")


# Create a binary variable 'High' based on Sales
Carseats$High <- ifelse(Carseats$Sales >= 8, "Yes", "No")
Carseats$High <- as.factor(Carseats$High)  # Convert to factor for classification


# Set seed for reproducibility
set.seed(123)

# Split the data
sample_index <- sample(seq_len(nrow(Carseats)), size = 0.7 * nrow(Carseats))
train_data <- Carseats[sample_index, ]
test_data <- Carseats[-sample_index, ]


# Install and load the tree package if not already installed
install.packages("tree")
library(tree)

# Fit the decision tree model on training data
tree_model <- tree(High ~ . -Sales, data = train_data)
summary(tree_model)

# Plot the decision tree
plot(tree_model)
text(tree_model, pretty = 0)


# Predict on the test data
tree_pred <- predict(tree_model, test_data, type = "class")

# Confusion matrix and accuracy
confusion_matrix <- table(Predicted = tree_pred, Actual = test_data$High)
confusion_matrix
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
accuracy * 100


# Cross-validation for pruning
cv_tree <- cv.tree(tree_model, FUN = prune.misclass)
plot(cv_tree$size, cv_tree$dev, type = "b", xlab = "Tree Size", ylab = "Misclassification Error")

# Prune the tree to the optimal size
optimal_size <- which.min(cv_tree$dev)
pruned_tree <- prune.misclass(tree_model, best = optimal_size)
plot(pruned_tree)
text(pruned_tree, pretty = 0)


# Predict on test data with pruned tree
pruned_tree_pred <- predict(pruned_tree, test_data, type = "class")
pruned_conf_matrix <- table(Predicted = pruned_tree_pred, Actual = test_data$High)
pruned_accuracy <- sum(diag(pruned_conf_matrix)) / sum(pruned_conf_matrix)
pruned_conf_matrix
pruned_accuracy * 100


