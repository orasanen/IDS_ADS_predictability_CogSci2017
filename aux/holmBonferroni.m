function [siglevels,h] = holmBonferroni(p,alpha)
% function [siglevels,h] = holmBonferroni(p,alpha)

if nargin <2
    alpha = 0.05;
end

if(size(p,1) > 1 && size(p,2) > 1)
    error('p must be a vector');
end
if(size(p,2) > 1)
    p = p';
end

[psort,i] = sort(p,'ascend'); 

m = length(p);

siglev = zeros(size(p));
for k = 1:length(i);    
   siglev(k) =  alpha/(m+1-k);
end

h = zeros(size(p));
a = find(psort > siglev,1);
h(i(1:a-1)) = 1;

siglevels = zeros(length(siglev),1);
for k = 1:length(siglev)
    siglevels(i(k)) = siglev(k);
end




