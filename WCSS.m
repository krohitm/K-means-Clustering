function [WCSS] = objFunc(U, X, V, clusterCount)

WCSS = 0;
for i = 1:clusterCount
    WCSS = WCSS + (U(i,:)*(X - V));
end;