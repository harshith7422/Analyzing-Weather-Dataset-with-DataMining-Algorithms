# Load the required library
if (!requireNamespace("cluster", quietly = TRUE)) {
  install.packages("cluster")
}
library(cluster)
#importing the dataset
data <- read.csv("C:/Users/Harshith Y/Downloads/seattle-weather.csv")
data

# Select the features for clustering
subset_data <- data[, c("precipitation", "temp_max", "temp_min")]

# Perform CLARA clustering
# You need to specify the number of clusters (k) and the number of samples to sample (sampsize)
k <- 3
sampsize <- 100  # You can adjust this according to your dataset size
clara_result <- clara(subset_data, k, sampsize = sampsize)

# Get cluster assignments
cluster_assignments <- clara_result$clustering

# Visualize the clusters
# Scatter plot of precipitation vs temp_max, colored by cluster
plot(subset_data[, c("precipitation", "temp_max")], 
     col = cluster_assignments,
     main = "CLARA Clustering: Precipitation vs. Maximum Temperature",
     xlab = "Precipitation",
     ylab = "Maximum Temperature")

# Add cluster medoids to the plot
points(subset_data[clara_result$medoids, c("precipitation", "temp_max")], 
       col = 1:k,
       pch = 8, 
       cex = 2)
