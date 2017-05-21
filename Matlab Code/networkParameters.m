% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% August 2016

global dt T t Nt
dt = 1*1e-2;
T = 30;
t = 0:dt:T;
Nt = length(t);

global A N kind
kind = input('[1] -> Synthetic topologies, [2] -> Real topologies. Choice: ');
if kind==1
    N = input('Number of nodes: ');
    A = zeros(N);
end
buildIncidenceMatrix;

%% Coupling Strength
global c
c = input('Coupling strength: ');

global cv_thresdhold
cv_thresdhold = 0.35;