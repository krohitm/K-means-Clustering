function [clusters] = clusters(Y)
keySet = unique(Y);
valueSet = [1:size(keySet,1)];
mapObj  = containers.Map(keySet, valueSet);
mapObj(keySet{1,1});
clusters = values( mapObj, Y);