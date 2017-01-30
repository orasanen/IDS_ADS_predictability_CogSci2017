function LL = getSeqLikelihood(seq,M,lambda)
% function LL = getSeqLikelihood(seq,M,lambda)

m = size(lambda,1);
LL = zeros(length(seq),1);

for t = m+1:length(seq)

    LL(t) = getP(seq(1:t),M,lambda);
 
end