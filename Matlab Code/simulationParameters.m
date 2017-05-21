% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% September 2015

global ti
ti = 1;

global x0 e0 N

%% Random initial conditions in the range [-pi,pi]
x0 = 2*pi*(rand(N,1)-.5); 
 
%% Other Parameters
xbar0 = average(x0,n,N);
e0 = kron(ones(N,1),xbar0) - x0;

global x e u
x = zeros(N*n,1);
e = zeros(N*n,1);
u = zeros(N*n,1);

global X E U
X = zeros(N*n,Nt);
E = zeros(N*n,Nt);
U = zeros(N*n,Nt);

global ETA
ETA = zeros(1,Nt);

global thetaN phiN phiBarN rhoN rhogN rhog rhogSD
thetaN = zeros(N,Nt);
phiN = zeros(N,Nt);
phiBarN = zeros(N,1);
rhoN = zeros(N,1);
rhogN = zeros(1,Nt);
rhog = 0;
rhogSD = 0;