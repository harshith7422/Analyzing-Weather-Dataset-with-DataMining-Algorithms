#importing the dataset
data <- read.csv("C:/Users/Harshith Y/Downloads/seattle-weather.csv")
data

# Install and load the required packages
if (!requireNamespace("fpc", quietly = TRUE)) {
  install.packages("fpc")
}
library(fpc)

# Assuming you've already loaded your dataset 'weather_data'

# Select the features for clustering
subset_data <- weather_data[, c("precipitation", "temp_max", "temp_min")]

# Perform k-medoids clustering
k <- 3  # Number of clusters
kmedoids_result <- pamk(subset_data, k)

# Get cluster assignments
cluster_assignments <- kmedoids_result$pamobject$clustering

# Visualize the clusters
# Scatter plot of precipitation vs temp_max, colored by cluster
plot(subset_data[, c("precipitation", "temp_max")], 
     col = cluster_assignments,
     main = "K-Medoids Clustering: Precipitation vs. Maximum Temperature",
     xlab = "Precipitation",
     ylab = "Maximum Temperature")

# Add cluster medoids to the plot
points(subset_data[kmedoids_result$pamobject$id.med, c("precipitation", "temp_max")], 
       col = 1:k,
       pch = 8, 
       cex = 2)

