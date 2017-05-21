% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% November 2014

function groupSynchronization

global N Nt
global phiN phiBarN rhogN rhog rhogSD

for j=1:Nt
    for k=1:N
        rhogN(j) = rhogN(j) + exp(1i*(phiN(k,j)-phiBarN(k)));
    end
    rhogN(j) = abs(rhogN(j)/N);
end

% mean
rhog = mean(rhogN);

% std
rhogSD = std(rhogN);


end