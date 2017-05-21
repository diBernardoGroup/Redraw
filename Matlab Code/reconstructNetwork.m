% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% July 2016

function A = reconstructNetwork(Phases)

% Phases is a 3-D matrix containing all the trials for all the players
% N: number of players
% Nt: number of time steps
% numTr: number of trials

[N,Nt,numTr] = size(Phases);

% M: matrix containing all the \rho_{ij} averaged over time, for all the
% trials
M = zeros(N,N,numTr);

for tr=1:numTr
    phases = Phases(:,:,tr);
    for i=1:N
        for j=1:N
            if j~=i
                sum = 0;
                for k=1:Nt
                    d = phases(i,k)-phases(j,k);
                    d = fixPhase(d);
                    if d<=0
                        sum = sum + (1+cos(d))/2;
                    end
                end
                M(i,j,tr) = sum/Nt;
            end
        end
    end
end

% Now we build A considering the average of each element of M over the
% total number of trials
A = zeros(N,N);

for tr=1:numTr
    A = A + M(:,:,tr);
end
A = A/numTr;

end