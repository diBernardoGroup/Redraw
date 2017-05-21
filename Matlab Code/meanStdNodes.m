% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% November 2014

meanVectors = zeros(1,N);
stdVectors = zeros(1,N);

for i=1:N
    meanVectors(i) = mean(phiN(i,:));
    stdVectors(i) = std(phiN(i,:));
end

display('mean of relative phases nodes-group: ');
meanVectors

display('standard deviation of relative phases nodes-group: ');
stdVectors