% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% June 2016

function band = setBand(edgeValue,minTop,maxTop,numBands)

% This function sets #numBands bands after thresholding

band = 0;

if edgeValue>0
    range = (maxTop-minTop)/numBands;
    i=2;
    while i<=numBands-1 && band==0
        if edgeValue>=minTop+(i-1)*range && edgeValue<minTop+i*range
            band = i;
        end
        i = i+1;
    end
    if band==0
        if edgeValue>=minTop && edgeValue<minTop+range
            band = 1;
        else
            band = numBands;
        end
    end
end

end