function [U] = WCSSup(X, V, clusterCount, sampleCount)

U = zeros(clusterCount,sampleCount);
D = zeros(clusterCount, 1);

for i = 1:sampleCount
    for j = 1:clusterCount
        D(j,1) = abs((sum((X(i,:) - V(j,:)).^2).^0.5));
    end;
    Dmin = D(1,1);
    for j = 2:clusterCount
        if D(j,1) < Dmin
            Dmin = D(j,1);
            U(j,i) = 1;
        %else
         %   U(j,i) = 0;
        end;
    end;
    if Dmin == D(1,1)
        U(1,i) = 1;
    end;
end;