% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% June 2016

function updateControlSignal

global c
global A N
global x u

u = zeros(N,1);
phi = pi/4;

for i = 1:N
    for j = 1:N
        if A(i,j)>0
            u(i) = u(i) + A(i,j)*sin(x(j)-x(i)-phi/A(i,j));
        end
    end
    u(i) = c/N * u(i);
end
    
end