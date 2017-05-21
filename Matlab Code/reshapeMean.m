% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% April 2016

function [meanVector] = reshapeMean(meanMatrix)

N = length(meanMatrix);
p = N*(N-1);

meanVector = zeros(p,1);
k = 0;

for i=1:N
    for j=1:N
        if i~=j
            k = k+1;
            meanVector(k) = meanMatrix(i,j);
        end
    end
end

end