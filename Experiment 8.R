# Load the USArrests dataset
data("USArrests")

# View the structure of the data
str(USArrests)

# Scale the data for PCA
us_data <- scale(USArrests)


# Perform PCA
pca_result <- prcomp(us_data, scale. = TRUE)
summary(pca_result)


# Scree plot to show variance explained
plot(pca_result, type = "l", main = "Scree Plot")


# Cumulative variance plot
variance_explained <- cumsum(pca_result$sdev^2 / sum(pca_result$sdev^2))
plot(variance_explained, type = "b", xlab = "Principal Component", ylab = "Cumulative Proportion of Variance Explained")


# Biplot for the first two principal components
biplot(pca_result, scale = 0)
