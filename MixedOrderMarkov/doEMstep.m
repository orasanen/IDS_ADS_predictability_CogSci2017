function [newM,newlambdas] = doEMstep(seq,M,lambda)

alphsize = size(lambda,2);
m = size(lambda,1);
fi = zeros(m,length(seq)-m);

% EM-step
for t = m+1:length(seq)    
    for k = 1:m
        if(k > 1)
        deno = 1-lambda(1,seq(t-1));
        for j = 2:k-1
            deno = deno*(1-lambda(j,seq(t-j)));
        end      
        else
            deno = 1;
        end
        fi(k,t) = lambda(k,seq(t-k))*M(seq(t-k),seq(t),k)*deno/getP(seq(t-m:t),M,lambda);                
    end
end

% M-step

newlambdas = zeros(m,alphsize);

for k = 1:m
    for w = 1:alphsize
        v1 = 0;
        v2 = 0;
        for t = m+1:size(fi,2)
            if(seq(t-k) == w)
                v1 = v1+fi(k,t);
                v2 = v2+sum(fi(k:m,t));
            end
        end
        if(v2 > 0)            
            newlambdas(k,w) = v1/v2;
        end
        
    end    
end

newM = zeros(size(M));

for k = 1:m
    for w = 1:alphsize
        for ww = 1:alphsize
            v1 = 0;
            v2 = 0;
            for t = m+1:size(fi,2)
                if(seq(t-k) == w)
                    v2 = v2+fi(k,t);
                    if(seq(t) == ww)
                        v1 = v1+fi(k,t);
                    end
                end
            end
            if(v2 > 0)
            newM(w,ww,k) = v1/v2;
            end
        end
    end
end