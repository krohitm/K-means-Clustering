function [WCSS] = objFunc(U, X, V, clusterCount, sampleCount)

WCSS = 0;
for i = 1:clusterCount
    WCSS = WCSS + (U(i,:) * sum(((X - repmat(V(i,:), sampleCount, 1)).^2),2));
end;