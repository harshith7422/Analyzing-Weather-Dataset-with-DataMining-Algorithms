# Assuming you've already loaded your dataset 'weather_data'

# Select the features for clustering
subset_data <- data[, c("precipitation", "temp_max", "temp_min")]

# Open a new plotting device
if (Sys.info()["sysname"] == "Windows") {
  windows()
} else if (Sys.info()["sysname"] == "Darwin") {
  quartz()
} else {
  X11()
}

# Perform hierarchical clustering
hclust_result <- hclust(dist(subset_data))

# Plot dendrogram
plot(hclust_result, main = "Dendrogram: Hierarchical Clustering", xlab = "Observations", ylab = "Distance")
