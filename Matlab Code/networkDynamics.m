% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% December 2014

function [ xp ] = networkDynamics(u)

global N

xp = zeros(N,1);

for i = 1:N
    xp(i) = nodeDynamics(i);
end

xp = xp + u;

end