% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% May 2017

%% clearing
close all;
clear all;
clc;

%% load parameters
networkParameters;
nu = input('DPI threshold ( 0<nu<1 ): ');
mu = input('Edges threshold ( 0<mu<nu ): ');
numTr = input('Number of trials to perform: ');
numBands = 20;

global window
window = 1000;

global rhog rhogSD
groupSynchronization_mean = zeros(1,numTr);
groupSynchronization_std = zeros(1,numTr);
cv = zeros(1,numTr);

%% simulations
PhasesKuramoto = zeros(N,Nt,numTr);

global thetaN cv_thresdhold
tr = 1;
while tr<=numTr
    tr
    nodeParameters;
    simulationParameters;
    simulation;
    phaseVector;
    relativePhase;
    cv_temp = get_cv(thetaN);
    if cv_temp<=cv_thresdhold
        groupSynchronization;
        groupSynchronization_mean(tr) = rhog;
        groupSynchronization_std(tr) = rhogSD;
        PhasesKuramoto(:,:,tr) = thetaN;
        cv(tr) = cv_temp;
        tr = tr+1;
    end
end


% PhasesKuramoto can be replaced with any experimental data collected from
% "real experiments". The only constraint is that PhasesKuramoto needs to
% be a 3D array where 1) number of nodes, 2) number of samples, 3) number
% of trials. Specifically, this means that PhasesKuramoto(2,:,5) will be
% the phase trajectory of the second node, collected in the 5th experiment.



%% network reconstruction

% assigned matrix
[minA,maxA] = minMaxMatrix(A);
A_assigned = bandMatrix(A,minA,maxA,numBands);

% DPI and thresholding
A_noDPI = reconstructNetwork(PhasesKuramoto);
A_DPI = condDPI( A_noDPI,nu );
[A_DPI_threshold,minA,maxA] = thresholdMatrix(A_DPI,mu);
A_DPI_band = bandMatrix(A_DPI_threshold,minA,maxA,numBands);


[PPV, ACC, TPR, FPR] = metrics(A_assigned,A_assigned,A_DPI_band,1)

gSynch = [mean(groupSynchronization_mean) mean(groupSynchronization_std)];
coeff_Var = [mean(cv) std(cv)];