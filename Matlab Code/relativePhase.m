% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% June 2016

function relativePhase

global N Nt
global thetaN phiN phiBarN rhoN

q = zeros(1,Nt);

for j=1:Nt
    for k=1:N
        q(j) = q(j) + exp(1i*thetaN(k,j));
    end
    q(j) = q(j)/N;
    q(j) = atan2(imag(q(j)),real(q(j)));
end

for k=1:N
    phiN(k,:) = thetaN(k,:)-q;
    phiN(k,:) = fixPhase(phiN(k,:));
end

for k=1:N
    for j=1:Nt
        phiBarN(k) =  phiBarN(k) + exp(1i*phiN(k,j));
    end
    phiBarN(k) = phiBarN(k)/Nt;
    rhoN(k) = abs(phiBarN(k));
    phiBarN(k) = atan2(imag(phiBarN(k)),real(phiBarN(k)));
end

end