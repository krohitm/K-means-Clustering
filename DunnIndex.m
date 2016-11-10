function [DI] = DunnIndex(X, U, V, clusterCount, sampleCount)

minDelta = Inf;
for i=1:(clusterCount - 1)
    for j=(i+1):clusterCount
        delta = (sum((V(i,:) - V(j,:)).^2)).^0.5;
        if delta < minDelta
            minDelta = delta;
        end;
    end;
end;

maxScatter = 0;
for i=1:clusterCount
    scatter = (U(i,:) * sum(((X - repmat(V(i,:), sampleCount, 1)).^2),2).^0.5)./sum(U(i,:));
    if scatter > maxScatter
        maxScatter = scatter;
    end;
end;

DI = minDelta/maxScatter;
    