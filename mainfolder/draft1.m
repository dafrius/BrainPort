



trialNo=1;
strcasemat=repmat(1:0,1,2);
bardotmat=sort(repmat(1:0,1,2);
trialMat=[strcasemat;bardotmat];
randomizer=randperm(length(trialMat));
trialMat=trialMat(randomizer);
strc1count=0;
strc2count=0;
while reversal <5
    if trialMat(1,trialNo)==0
        staircase1
        strc1count=strc1count+1;
        if trialMat(2,trialNo)==0
            bar
            dot
        else
            dot
            bar
        end
        
    else 
        staircase2
        strc2count=strc2count+1;
        if trialMat(2,trialNo)==0
            bar
            dot
        else
            dot
            bar
        end
    end
    trialNo=trialNo+1;
    if mod(trialNo,4)==1
        strcasemat=repmat(1:0,1,2);
        bardotmat=sort(repmat(1:0,1,2);
        interimMat=[strcasemat;bardotmat];
        randomizer=randperm(length(interimMat));
        interimMat=interimMat(randomizer);
        trialMat=[trialMat interimMat];
    end
end
   
            