% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% July 2016

function cv = get_cv(Theta)

global Nt N window

op = zeros(1,Nt);
for k=1:Nt
    for j=1:N
        op(k) = op(k)+exp(1i*Theta(j,k));
    end
    op(k) = op(k)/N;
end

psi = angle(op);
psidot = diffPsi(psi);

cv = abs(std(psidot(end-window:end))/mean(psidot(end-window:end)));

end