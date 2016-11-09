function [V] = clusterMeans(U, X, clusterCount, featureCount, sampleCount)
V = zeros(clusterCount,featureCount);
for i=1:clusterCount
    for j = 1:sampleCount
        V(i,:) = (U(i,:)*X)./(sum(U(i,:)));
    end;
end;