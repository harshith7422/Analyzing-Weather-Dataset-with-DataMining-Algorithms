#datamining da-2
#performing various clustering techniques on a Weather Dataset.

#importing the dataset
data <- read.csv("C:/Users/Harshith Y/Downloads/seattle-weather.csv")
data

#select features for performing clustering
subset_data <- data[, c("precipitation", "temp_max", "temp_min")]

# Assuming you want to create 3 clusters
k <- 3
kmeans_result <- kmeans(subset_data, centers = k)

cluster_assignments <- kmeans_result$cluster

# Scatter plot of precipitation vs temp_max, colored by cluster
plot(subset_data[, c("precipitation", "temp_max")], 
     col = cluster_assignments,
     main = "K-Means Clustering: Precipitation vs. Maximum Temperature",
     xlab = "Precipitation",
     ylab = "Maximum Temperature")

# Add cluster centers to the plot
points(kmeans_result$centers[, c("precipitation", "temp_max")], 
       col = 1:k,
       pch = 8, 
       cex = 2)
