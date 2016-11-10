function [X, Y, U, V, i, WCSS, DI, DBI] = runProgram(dataset, clusterCount, initialMean)
X = importX(dataset);
Y = importY(dataset);

featureCount = size(X,2);
sampleCount = size(X,1);

%V = repmat(initialMean, clusterCount, featureCount);
kindex = randsample(1:length(X), clusterCount);
V = X(kindex,:);
%V = initialMean;
[U, V, i, WCSS] = updateAlgo(X, V, clusterCount, featureCount, sampleCount);
plotClusters(X, Y);
plotKClusters(X, U, V);
DI = DunnIndex(X, U, V, clusterCount, sampleCount);
DBI = DavisBouldinIndex(X, U, V, clusterCount, sampleCount);
tree = linkage(X,'average','euclidean');
dendrogram(tree);
