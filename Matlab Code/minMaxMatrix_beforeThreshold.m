% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% October 2015

function [minA,maxA] = minMaxMatrix_beforeThreshold(A)

% We find the minimum and the maximum in a matrix A
Atemp = A;
N = length(A);

% We want to rule out all the elements on the diagonal matrix
for i=1:N
    Atemp(i,i) = inf;
end

minA = min(min(Atemp));
maxA = max(max(A));

end