function [U, i, WCSS] = updateAlgo(X, V, clusterCount, featureCount, sampleCount)

Uprev = zeros(clusterCount, sampleCount);

for i = 1:10000
    U = memMat(X, V, clusterCount, sampleCount);
    V = clusterMeans(U, X, clusterCount, featureCount, sampleCount);
    if Uprev == U
        break;
    end;
    Uprev = U;
    WCSS(i,1) = objFunc(U, X, V, clusterCount, sampleCount);
end;
