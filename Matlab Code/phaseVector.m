% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% December 2014

function phaseVector

global thetaN X N

for i=1:N
    thetaN(i,:) = fixPhase(X(i,:));
end

end