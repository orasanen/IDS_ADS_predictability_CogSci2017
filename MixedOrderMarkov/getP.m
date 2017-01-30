function [P,deno] = getP(seq,M,lambda)

m = size(lambda,1);

% Compute probability P(w[t]|w[t-1],w[t-2],...,w[t-m])
P = 0;

for k = 1:m
    if(k > 1)
        deno = 1-lambda(1,seq(end-1));
        for j = 2:k-1
            deno = deno*(1-lambda(j,seq(end-j)));
        end
    else
        deno = 1;
    end
    P = P+lambda(k,seq(end-k))*M(seq(end-k),seq(end),k)*deno;
end



