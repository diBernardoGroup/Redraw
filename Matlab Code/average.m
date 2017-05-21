% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% April 2014

function [ xbar ] = average( x,n,N )

xbar = zeros(n,1);

for i=1:N
    xbar = xbar + x(n*(i-1)+1:n*i);
end

xbar = xbar/N;

end