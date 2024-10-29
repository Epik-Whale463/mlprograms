# Load the dataset
nc160_data <- read.csv("path_to_your_nc160_data.csv")


# Retain only numeric columns if necessary
nc160_data_numeric <- nc160_data[, sapply(nc160_data, is.numeric)]

# Scale the data
nc160_data_scaled <- scale(nc160_data_numeric)


# Compute the distance matrix
distance_matrix <- dist(nc160_data_scaled, method = "euclidean")


# Perform hierarchical clustering with Ward's method
hc_result <- hclust(distance_matrix, method = "ward.D")


# Plot the dendrogram
plot(hc_result, labels = FALSE, main = "Dendrogram of NC160 Dataset", xlab = "", sub = "")
abline(h = 10, col = "red") # Cut line for clusters, adjust height as necessary


# Cut dendrogram to create clusters
clusters <- cutree(hc_result, k = 3) # Adjust k for desired number of clusters
table(clusters) # Check cluster sizes


# Using PCA for visualization
library(factoextra)
fviz_cluster(list(data = nc160_data_scaled, cluster = clusters))


# Check average values for each cluster
aggregate(nc160_data_numeric, by = list(cluster = clusters), mean)
