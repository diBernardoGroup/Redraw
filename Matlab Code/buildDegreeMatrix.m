% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% May 2014

function D = buildDegreeMatrix

global N;
global A;

D = zeros(N,N);

for i=1:N
    D(i,i) = sum(A(i,:));
end

end