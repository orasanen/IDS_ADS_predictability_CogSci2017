function [prob,prediction,P] = predictSeqMixedOrder(seq,M,lambda)
% [prob,prediction] = predictSeqMixedOrder(seq,M,lambda)

% lags = 1:size(lambda,1);
% maxlag = length(lags);
% 
% pred = zeros(max(seq),1);
% for lag = 1:maxlag
%    
%     prevind = seq(end-lag+1);
%     prev_dist = M(prevind,:,lag);
%     prev_weight = lambda(lag,prevind);       
%     pred = pred+prev_weight.*prev_dist';    
%     
% end
% 
% [prob,prediction] = max(pred);

P = zeros(size(M,1),1);

for alph = 1:size(M,1);

    seqn = [seq;alph];    
    [P(alph),deno] = getP(seqn,M,lambda);
end

[prob,prediction] = max(P);