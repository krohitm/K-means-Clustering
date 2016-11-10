function [U, V, i, WCSS] = updateAlgo(X, V, clusterCount, featureCount, sampleCount)

Uprev = zeros(clusterCount, sampleCount);

for i = 1:50
    U = memMat(X, V, clusterCount, sampleCount);
    V = clusterMeans(U, X, clusterCount, featureCount);
    WCSS(i,1) = objFunc(U, X, V, clusterCount, sampleCount);
    if Uprev == U
        break;
    end;
    Uprev = U;
end;
figure();
hold on;
plot (1:size(WCSS,1), WCSS);
xlabel ('No. of iterations');
ylabel ('Within Cluster Square Sum');
title ('Objective function against iterations');
