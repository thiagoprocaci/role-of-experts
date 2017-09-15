#F. Graph and Correlation Analysis
options(warn=-1)

source("../functions/Functions.R")


allData <- read.csv(file = "graph.csv", header = TRUE, sep = ";", dec = ",")
experts = subset(allData, allData$ex == 1)
others = subset(allData, allData$ex == 0)

correlation(experts$indegree, experts$reputation, "Experts indegree x reputation")

correlation(others$indegree, others$reputation, "Others indegree x reputation")

correlation(experts$outdegree, experts$reputation, "Experts outdegree x reputation")

correlation(others$outdegree, others$reputation, "Others outdegree x reputation")

correlation(experts$pagerank, experts$reputation, "Experts pagerank x reputation")

correlation(others$pagerank, others$reputation, "Others pagerank x reputation")

correlation(experts$closeness, experts$reputation, "Experts closeness x reputation")

correlation(others$closeness, others$reputation, "Others closeness x reputation")

correlation(experts$betweeness, experts$reputation, "Experts betweeness x reputation")

correlation(others$betweeness, others$reputation, "Others betweeness x reputation")

correlation(experts$eccentricity, experts$reputation, "Experts eccentricity x reputation")

correlation(others$eccentricity, others$reputation, "Others eccentricity x reputation")

correlation(experts$eigenvector, experts$reputation, "Experts eigenvector x reputation")

correlation(others$eigenvector, others$reputation, "Others eigenvector x reputation")









