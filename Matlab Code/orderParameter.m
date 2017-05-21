% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% January 2015

function op = orderParameter

global Nt 
global N thetaN

op = zeros(1,Nt);
for i=1:Nt
    for j=1:N
        op(i) = op(i)+exp(1i*thetaN(j,i));
    end
    op(i) = op(i)/N;
end

end