#importing the dataset
data <- read.csv("C:/Users/Harshith Y/Downloads/seattle-weather.csv")
data

# Install and load the required library
if (!requireNamespace("cluster", quietly = TRUE)) {
  install.packages("cluster")
}
library(cluster)

# Assuming you've already loaded your dataset 'weather_data'

# Select the features for clustering
subset_data <- data[, c("precipitation", "temp_max", "temp_min")]

# Perform agglomerative hierarchical clustering (agnes)
agnes_result <- cluster::agnes(subset_data)

# Visualize the dendrogram
plot(agnes_result, main = "Dendrogram: Agglomerative Hierarchical Clustering")
