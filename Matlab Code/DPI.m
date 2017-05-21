% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% February 2016

function [ A_DPI ] = DPI( A )

[N,~] = size(A);
A_DPI = A;

% DPI on a directed weighted matrix
for i=1:N
    for j=1:N
        if j~=i
            for k=1:N
                if k~=i && k~=j
                    aik = A(i,k); aij = A(i,j); ajk = A(j,k);
                    if aik>0 && aij>0 && ajk>0 && aik<aij && aik<ajk
                        A_DPI(i,k) = 0;
                    end
                end
            end
        end
    end
end

end