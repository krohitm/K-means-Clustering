function [U] = memMat(X, V, clusterCount, sampleCount)

U = zeros(clusterCount,sampleCount);
D = zeros(clusterCount, 1);

for i = 1:sampleCount
    for j = 1:clusterCount
        D(j,1) = abs((sum((X(i,:) - V(j,:)).^2).^0.5));
    end;
    Dmin = min(D);
    commonClusters = find(Dmin == D);
    clusterIndex = randsample(commonClusters, 1);
    U(clusterIndex, i) = 1;
end;