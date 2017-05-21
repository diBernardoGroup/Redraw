% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% April 2014

function record

global ti
global x e u eta
global X E U ETA

X(:,ti) = x;
U(:,ti) = u;
E(:,ti) = e;
ETA(ti) = eta;

end