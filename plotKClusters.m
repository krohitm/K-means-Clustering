function [] = plotKClusters(X, U, V)
n = size(X,1);
class = zeros(n,1);
features = {'Sepal Length'; 'Sepal Width'; 'Petal Length'; 'Petal Width'};

for i = 1:n
    sample = U(:,i);
    K = find(sample == 1);
    class(i,1) = K;
end;

valueSet = unique(class);
CM = jet(length(valueSet) + 1);
figure();
for i = 1:length(valueSet)
    Xtemp = X(class == valueSet(i,1), :);
    scatter3(Xtemp(:,1), Xtemp(:,4), Xtemp(:,3), 15, ...
    'MarkerFaceColor', CM(i+1,:));
    hold on;
end;
title ('Clusters from K means algorithm');
legend ('Cluster 1', 'Cluster 2', 'Cluster 3');
xlabel (features{1,1});
ylabel (features{4,1});
zlabel (features{3,1});

CM = jet(length(valueSet) + 2);
for i=1:length(valueSet)
    scatter3(V(i,1), V(i,4), V(i,3), ...
        'LineWidth', 10, ...
        'MarkerFaceColor', CM(i+2,:));
end;
    