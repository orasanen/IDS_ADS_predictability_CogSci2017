function [M,lambda] = getMixedOrderModel(seq,maxorder,n_iters)
% function [M,lambda] = getMixedOrderModel(seq,maxorder,n_iters)
% Creates Mixed-Order Markov model according to Saul & Pereira (1997):
% Aggregate and mixed-order Markov models for statistical language processing
% 
% getVarOrdModel(seq) estimates the variable order Markov-model for sequence
% seq 
%
% getVarOrdModel(seq,maxorder) estimates the variable order Markov-model 
% for sequence seq with maximum order of maxorder (default = 5).
%
% getVarOrdModel(seq,maxorder,n_iters) estimates the variable order Markov-
% model for sequence seq with maximum order of maxorder and n_iters 
% iterations of the EM-algorithm.
% 
% Outputs:
%   M = Transition probability matrix for each lag
%   lambda = lag specific weights for each sequence element
if nargin <4
    maxval = max(seq);
end
if nargin <3
    n_iters = 5;
end
if nargin <2
   maxorder = 5;
end

[M,lambda] = formatEM(seq,1:maxorder,maxval);

m = maxorder;

LL = zeros(n_iters,1);
for iter = 1:n_iters    
    P = zeros(length(seq)-m,1);
    for t = m+1:length(seq)
        P(t) = getP(seq(t-m:t),M,lambda);
    end        
    LL(iter) = sum(P);
    fprintf('Likelihood: %0.3f.\n',LL(iter));        
    [M,lambda] = doEMstep(seq,M,lambda);        
   % sfigure(6);plot(LL(1:iter));
end

