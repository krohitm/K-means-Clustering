function[] = plotActualClusters(X, Y)
%D = size(X,2);
keySet = unique(Y);
valueSet = [1:size(keySet,1)];
mapObj  = containers.Map(keySet, valueSet);
clusters = cell2mat(values( mapObj, Y));
features = {'Sepal Length'; 'Sepal Width'; 'Petal Length'; 'Petal Width'};

CM = jet(length(valueSet) + 1);
figure;
for i=1:length(valueSet)
    selClust = mapObj(keySet{i,1});
    Xtemp = X(clusters == selClust, :);
    scatter3(Xtemp(:,1), Xtemp(:,3), Xtemp(:,4), 15, ...
    'MarkerFaceColor',CM(i+1,:));
    hold on;
end;
title ('Ground Truth of the data');
legend (keySet{1,1}, keySet{2,1}, keySet{3,1});
xlabel (features{1,1});
ylabel (features{3,1});
zlabel (features{4,1});