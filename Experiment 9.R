# Load NC160 data (assuming it's in CSV format and saved locally)
nc160_data <- read.csv("path_to_nc160_data.csv")


# View structure and summary of the dataset
str(nc160_data)
summary(nc160_data)

# Remove any non-numeric or identifier columns if necessary
nc160_data_numeric <- nc160_data[, sapply(nc160_data, is.numeric)]

# Scale the numeric data
nc160_data_scaled <- scale(nc160_data_numeric)


# Install and load the factoextra package for visualization
install.packages("factoextra")
library(factoextra)

# Calculate WSS for 1 to 10 clusters
wss <- sapply(1:10, function(k) {kmeans(nc160_data_scaled, centers = k, nstart = 25)$tot.withinss})
plot(1:10, wss, type = "b", pch = 19, frame = FALSE,
     xlab = "Number of Clusters K", ylab = "Total within-clusters sum of squares")


# Apply K-Means with k = 3
set.seed(123) # For reproducibility
kmeans_result <- kmeans(nc160_data_scaled, centers = 3, nstart = 25)


# Visualize clusters
fviz_cluster(kmeans_result, data = nc160_data_scaled, geom = "point", ellipse.type = "norm")


# Display cluster centers and sizes
kmeans_result$centers
kmeans_result$size


