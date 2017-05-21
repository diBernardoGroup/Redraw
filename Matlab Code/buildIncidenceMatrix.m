% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% August 2016

function buildIncidenceMatrix

global A N kind
global topology topology17 topology20

if kind==1
    if N==4
        display('Choose the topology');
        display(' [0]: Disconnected network');
        display(' [1]: Directed Weighted [(1->2), (4->3)] connected');
        display(' [2]: Directed Weighted Path graph');
        display(' [3]: Directed Weighted Star graph');
        display(' [4]: Directed Weighted Complete graph');
        topology = input('Choice: ');

        if topology==0
            A = zeros(N,N);

        elseif topology==1
            A = zeros(N,N);
            A(2,1) = 1;
            A(3,4) = 3;

        elseif topology==2
            A = zeros(N);
            A(1,2) = 3; A(2,3) = 1.5; A(3,4) = 1;

        elseif topology==3
            A = zeros(N);
            A(1,2) = 3; A(3,1) = 1; A(4,1) = 1;

        elseif topology==4
            A = zeros(N);
            A(4,1) = 3; A(4,2) = 3; A(4,3) = 1.5;
            A(2,3) = 3; A(1,2) = 3; A(1,3) = 2;
        end

    elseif N==17
        display('Choose the topology');
        display(' [1]: Four sub-topologies with central hub');
        display(' [2]: Ravasz-Barabasi network');
        topology17 = input('Choice: ');

        A = zeros(N,N);

        if topology17==1
            A(4,1) = 3; A(4,2) = 3; A(4,3) = 1.5;
            A(2,3) = 3; A(1,2) = 3; A(1,3) = 2;

            A(7,6) = 3; A(7,5) = 3; A(7,8) = 1.5;
            A(5,8) = 3; A(6,5) = 3; A(6,8) = 2;

            A(10,11) = 3; A(10,12) = 3; A(10,9) = 1.5;
            A(12,9) = 3; A(11,12) = 3; A(11,9) = 2;

            A(13,16) = 3; A(13,15) = 3; A(13,14) = 1.5;
            A(15,14) = 3; A(16,15) = 3; A(16,14) = 2;

            A(4,17) = 5; A(17,4) = 5; A(7,17) = 5; A(17,7) = 5;
            A(10,17) = 5; A(17,10) = 5; A(13,17) = 5; A(17,13) = 5;


        elseif topology17==2
            A(4,1) = 3; A(4,2) = 3; A(4,3) = 1.5;
            A(2,3) = 3; A(1,2) = 3; A(1,3) = 2;

            A(7,6) = 3; A(7,5) = 3; A(7,8) = 1.5;
            A(5,8) = 3; A(6,5) = 3; A(6,8) = 2;

            A(10,11) = 3; A(10,12) = 3; A(10,9) = 1.5;
            A(12,9) = 3; A(11,12) = 3; A(11,9) = 2;

            A(13,16) = 3; A(13,15) = 3; A(13,14) = 1.5;
            A(15,14) = 3; A(16,15) = 3; A(16,14) = 2;

            for i=1:N-1
                A(17,i) = 5;
            end

        end

    elseif N==20
        display('Choose the topology');
        display(' [1]: Regular network');
        display(' [2]: Small world network');
        topology20 = input('Choice: ');

        A = zeros(N,N);
        for i=3:N
            A(i,i-2) = 1;
            A(i,i-1) = 5;
        end
        A(1,N-1) = 1;
        A(1,N) = 5;
        A(2,1) = 5;
        A(2,N) = 1;

        if topology20==2
            A(8,3) = 2;
            A(12,7) = 2;
            A(16,11) = 2;
            A(20,15) = 2;
            A(4,19) = 2;
        end

    end
    
elseif kind==2
    display('Choose the topology');
    display('[1]: IRMA network, 5 nodes');
    display('[2]: Enzyme-Catalyzed reaction pathway, 8 nodes');
    display('[3]: Songbird brain network, 12 nodes');
    display('[4]: Bank Stokcs Network during Lehman Bankruptcy, 16 nodes');
    display('[5]: Human PPI network, 23 nodes');
    display('[6]: Human PPI network, 25 nodes');
    display('[7]: HPGC, 48 nodes');
    topology = input('Choice: ');
    
    if topology==1
        N = 5;
        A = zeros(N,N);
        A(1,4) = 1; A(2,1) = 1; A(3,1) = 1; A(3,2) = 1;
        A(4,3) = 1; A(4,5) = 1; A(5,1) = 1; A(5,4) = 1;
        
    elseif topology==2
        N = 8;
        A = zeros(N,N);
        A(1,8) = 1; A(2,1) = 1; A(3,2) = 1; A(4,3) = 1;
        A(5,4) = 1; A(6,5) = 1; A(7,6) = 1;
        
    elseif topology==3
        N = 12;
        A = zeros(N,N);
        A(1,8) = 1; A(3,1) = 1; A(4,3) = 1; A(8,4) = 1;
        A(3,2) = 1; A(5,2) = 1; A(6,5) = 1; A(9,4) = 1;
        A(10,6) = 1; A(10,7) = 1; A(11,9) = 1; A(11,10) = 1;
        A(12,11) = 1;
    
    elseif topology==4
        k = 1;
        N = 16;
        A = zeros(N,N);
        
        % Weighted topology
        
        b = 1; %black
        r = 2; %red
        o = 3; %orange
        
        k = k+1;
        A(k,13) = o; A(k,1) = o; A(k,3) = b; A(k,4) = r; A(k,5) = b; A(k,9) = b;
        
        k = k+1;
        A(k,5) = b; A(k,9) = b;
        
        k = k+1;
        A(k,5) = b; A(k,9) = b;
        
        k = k+2;
        A(k,9) = b; A(k,13) = r; A(k,1) = r; A(k,3) = o; A(k,5) = b;
        
        k = k+1;
        A(k,9) = b; A(k,13) = o; A(k,5) = r;
        
        k = k+1;
        A(k,9) = r;
        
        k = k+2;
        A(k,9) = b; A(k,5) = r; A(k,1) = o; A(k,13) = r;
        
        k = k+1;
        A(k,9) = r; A(k,5) = o;
        
        k = k+1;
        A(k,9) = r;
        
        k = k+2;
        A(k,13) = o; A(k,9) = r; A(k,5) = r;
        
        k = k+1;
        A(k,9) = r;
        
        k = k+1;
        A(k,9) = b; A(k,5) = r;
        
        % Unweighted topology (possibly comment)
        for i=1:N
            for j=1:N
                if A(i,j) >0
                    A(i,j) = 1;
                end
            end
        end
        
    elseif topology==5
        N = 23;
        A = zeros(N,N);
        A(3,1) = 1; A(3,2) = 1; A(7,4) = 1; A(7,5) = 1; A(7,6) = 1;
        A(8,3) = 1; A(8,7) = 1; A(13,11) = 1; A(13,12) = 1;
        A(15,8) = 1; A(15,9) = 1; A(15,10) = 1; A(15,13) = 1; A(15,14) = 1;
        A(18,16) = 1; A(18,17) = 1; A(21,20) = 1; A(23,22) = 1;
        A(22,15) = 1; A(22,18) = 1; A(22,19) = 1; A(22,21) = 1;
        
    elseif topology==6
        N = 25;
        A = zeros(N,N);
        A(25,1:10) = 1; A(11:24,25) = 1;
        A(24,1) = 1; A(11,10) = 1; A(22,19) = 1;
        
    elseif topology==7
        N = 48;
        A = zeros(N,N);
        A(10,1) = 1;  A(11,2) = 1;  A(12,11) = 1; A(11,10) = 1; A(13,12) = 1;
        A(13,11) = 1; A(13,44) = 1; A(44,3) = 1;  A(44,47) = 1; A(14,13) = 1;
        A(47,10) = 1; A(47,11) = 1; A(47,43) = 1; A(45,47) = 1; A(45,13) = 1;
        A(17,45) = 1; A(46,17) = 1; A(46,45) = 1; A(15,46) = 1; A(16,46) = 1;
        A(18,9) = 1;  A(18,16) = 1; A(18,46) = 1; A(37,47) = 1; A(36,37) = 1;
        A(36,43) = 1; A(35,34) = 1; A(35,36) = 1; A(34,43) = 1; A(40,4) =  1;
        A(40,5) = 1;  A(41,40) = 1; A(42,41) = 1; A(43,40) = 1; A(43,42) = 1;
        A(48,7) = 1;  A(34,48) = 1; A(33,34) = 1; A(38,37) = 1; A(38,39) = 1;
        A(39,8) = 1;  A(39,22) = 1; A(24,39) = 1; A(22,45) = 1; A(23,24) = 1;
        A(32,6) = 1;  A(31,32) = 1; A(30,31) = 1; A(30,32) = 1; A(28,30) = 1;
        A(29,28) = 1; A(29,30) = 1; A(27,26) = 1; A(27,28) = 1; A(30,33) = 1;
        A(30,24) = 1; A(19,18) = 1; A(20,19) = 1; A(21,20) = 1; A(22,21) = 1;
        A(24,22) = 1; A(25,24) = 1; A(26,25) = 1; 
        
    end
end

% global D
% D = buildDegreeMatrix;

end