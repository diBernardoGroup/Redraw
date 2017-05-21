% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% July 2016

function [PPV, ACC, TPR, FPR] = metrics(A,A_undirected,inf_A,option)

% if option==1, the direction of the edges is taken into account
% if option==2, the direction of the edges is not taken into account,
% meaning that the directed matrices are turned into undirected matrices,
% and then all the metrics are evaluated

N = size(A);
N = N(1);

% true positive
eta_tp = 0;

% false positive
eta_fp = 0;

% true negative
eta_tn = 0;

% false negative
eta_fn = 0;

if option==1
    
    eta_tot = N*(N-1);
    for i=1:N
        for j=1:N
            if i~=j
                if A(i,j)>0 && inf_A(i,j)>0
                    eta_tp = eta_tp + 1;
                elseif A(i,j)==0 && inf_A(i,j)>0
                    eta_fp = eta_fp + 1;
                elseif A(i,j)==0 && inf_A(i,j)==0
                    eta_tn = eta_tn + 1;
                elseif A(i,j)>0 && inf_A(i,j)==0
                    eta_fn = eta_fn + 1;
                end
            end
        end
    end
    
elseif option==2
    eta_tot = N*(N-1)/2;
    inf_A_undirected = 0*inf_A;
    for i=2:N
        for j=1:i-1
            if inf_A(i,j)>0 || inf_A(j,i)>0
                inf_A_undirected(i,j) = 1;
                inf_A_undirected(j,i) = 1;
            end
        end
    end
          
    for i=2:N
        for j=1:i-1
            if A_undirected(i,j)>0 && inf_A_undirected(i,j)>0
                eta_tp = eta_tp + 1;
            elseif A_undirected(i,j)==0 && inf_A_undirected(i,j)>0
                eta_fp = eta_fp + 1;
            elseif A_undirected(i,j)==0 && inf_A_undirected(i,j)==0
                eta_tn = eta_tn + 1;
            elseif A_undirected(i,j)>0 && inf_A_undirected(i,j)==0
                eta_fn = eta_fn + 1;
            end
        end
    end
    
end


% Positive Predicted Value
sum = eta_tp+eta_fp;
if sum>0
    PPV = eta_tp/sum;
else
    PPV = 0;
end

% Accuracy Rate
ACC = (eta_tp+eta_tn)/eta_tot;

% True Positive Rate
sum = eta_tp+eta_fn;
if sum>0
    TPR = eta_tp/sum;
else
    TPR = 0;
end

% False Positive Rate
sum = eta_fp+eta_tn;
if sum>0
    FPR = eta_fp/sum;
else
    FPR = 1;
end

end