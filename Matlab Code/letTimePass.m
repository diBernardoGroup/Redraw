% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% December 2014

function letTimePass

global n N u
global dt
global x e eta 

xp = networkDynamics(u);
x = x + xp*dt;

xbar = average(x,n,N);

e = kron(ones(N,1),xbar) - x;
eta = norm(e);

end