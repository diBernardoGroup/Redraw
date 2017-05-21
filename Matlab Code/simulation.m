% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% April 2014

function simulation

global ti Nt
global x0 e0
global x e eta

x = x0;
e = e0;
eta = norm(e0);

for ti = 1:Nt
    record;
    updateControlSignal;
    letTimePass;
end