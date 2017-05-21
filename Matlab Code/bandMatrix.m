% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% June 2016

function A_band = bandMatrix(A,minA,maxA,numBands)

% This function turns the already thresholded matrix into a "band" matrix
s = size(A);
N = s(1);

if minA==0 && maxA==0
    A_band = zeros(N);
else
    A_band = zeros(N);
    for i=1:N
        for j=1:N
            if i~=j
                A_band(i,j) = setBand(A(i,j),minA,maxA,numBands);
            end
        end
    end
end

end