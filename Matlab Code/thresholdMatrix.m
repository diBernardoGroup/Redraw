% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% July 2016

function [A,minA,maxA] = thresholdMatrix(A,threshold)

% This function sets to 0 all the elements lower than the threshold

s = size(A);
N = s(1);

for i=1:N
    for j=1:N
        if A(i,j)<threshold
            A(i,j) = 0;
        end
    end
end

% Then we find the minimum(>0) and the maximum left in the matrix A
[minA,maxA] = minMaxMatrix(A);

end