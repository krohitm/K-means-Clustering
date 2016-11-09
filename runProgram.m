function [U, i, WCSS] = runProgram(dataset, clusterCount, initialMean)
X = importX(dataset);
%Y = importY(dataset);

featureCount = size(X,2);
sampleCount = size(X,1);

%V = repmat(initialMean, clusterCount, featureCount);
kindex = randsample(1:length(X), 3);
kmeans = X(kindex,:);
[U, i, WCSS] = updateAlgo(X, kmeans, clusterCount, featureCount, sampleCount);
plot (1:size(WCSS,1), WCSS);