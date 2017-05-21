% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% October 2015

function [minA,maxA] = minMaxMatrix(A)

% We find the minimum(>0) and the maximum in a matrix A
Atemp = A;
Atemp(Atemp == 0) = inf;
minA = min(min(Atemp));
maxA = max(max(A));

if minA==inf
    minA = 0;
    maxA = 0;
end

end