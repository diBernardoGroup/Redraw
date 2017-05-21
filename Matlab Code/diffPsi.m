% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% July 2016

function psidot = diffPsi(psi)

global dt
psidot = diff(psi/dt);

global Nt
for i=1:Nt-1
    if abs(psidot(i))>50
        if i>1
            psidot(i) = psidot(i-1);
        else
            psidot(1)=0;
        end
    end
end
        
psidot = [psidot(1) psidot];
        
end