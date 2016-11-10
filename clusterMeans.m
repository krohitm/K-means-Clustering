function [V] = clusterMeans(U, X, clusterCount, featureCount)
V = zeros(clusterCount,featureCount);
for i=1:clusterCount
    V(i,:) = (U(i,:)*X)./(sum(U(i,:)));
end;