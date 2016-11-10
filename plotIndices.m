function [DI, DBI] = plotIndices(dataset)

X = importX(dataset);
DI = zeros(9,1);
DBI = zeros(9,1);
for i=1:9
    [DI(i,1), DBI(i,1)] = runProgram(dataset, i+1);
end;
figure;
plot (2:10, DI(:,1));
title ('Dunn Index for various number of clusters');
xlabel ('Number of Clusters');
ylabel ('Dunn Index');

figure;
plot (2:10, DBI(:,1));
title ('Davis - Bouldin Index for various number of clusters');
xlabel ('Number of Clusters');
ylabel ('Davis - Bouldin Index');