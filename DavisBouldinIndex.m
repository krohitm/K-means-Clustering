function[DBI] = DavisBouldinIndex(X, U, V, clusterCount, sampleCount)

scatter = zeros(clusterCount,1);
for i=1:clusterCount
    scatter(i,1) = (U(i,:) * sum(((X - repmat(V(i,:), sampleCount, 1)).^2),2).^0.5)./sum(U(i,:));
end;


delta = zeros(clusterCount, clusterCount);
for i=1:(clusterCount - 1)
    for j=(i+1):clusterCount
        delta(i,j) = (sum((V(i,:) - V(j,:)).^2)).^0.5;
    end;
end;

DBI = 0;
for i = 1:(clusterCount - 1)
    for j = (i+1):clusterCount
        DBI = DBI + (scatter(i,1) + scatter(j,1))./delta(i,j);
    end;
end;
DBI = DBI/clusterCount;
