function [U] = memMat(X, V, clusterCount, sampleCount)

U = zeros(clusterCount,sampleCount);
D = zeros(clusterCount, 1);

turn = 1;
for i = 1:sampleCount
    for j = 1:clusterCount
        D(j,1) = abs((sum((X(i,:) - V(j,:)).^2).^0.5));
    end;
    Dmin = min(D);
    commonClusters = find(Dmin == D);
    if length(commonClusters) > 1
        clusterIndex = mod(turn,4);
        if clusterIndex == 3
            turn = turn + 2;
        else
            turn = turn + 1;
        end;
    else
        clusterIndex = commonClusters;
    end;
    %clusterIndex = randsample(commonClusters, 1);
    U(min(size(U,1),clusterIndex), i) = 1;
end;