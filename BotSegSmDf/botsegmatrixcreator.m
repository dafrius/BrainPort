answr=inputdlg({'Enter Subject ID:'},'ID',[1 18]);

%a=datestr(now, 'mm-dd-yyyy HH-MM');
output=[answr{1} 'matrix.xls'];
output2=[answr{1} 'matrix.mat'];



%Load the previously created matrix with .txt file names.
load alllettersinfo4.mat alllettersinfo;

%create a new struct with the file names and put the cell array with the
%filenames in it:
samedifmat.names=alllettersinfo.names(27:52);

%a shorter handle to create the new cell arrays easier.
names=samedifmat.names;

A=names(1); B=names(2); C=names(3); D=names(4); E=names(5); F=names(6); 
G=names(7); H=names(8); I=names(9); J=names(10); K=names(11); L=names(12);
M=names(13); N=names(14); O=names(15); P=names(16); Q=names(17); R=names(18);
S=names(19); T=names(20); U=names(21); V=names(22); W=names(23); X=names(24);
Y=names(25); Z=names(26);

%put onesegment letters into one cell array to make it easier to call from
%the group. putting the ones we are going to use as the first and last
%elements for easier call to the rest later.

samedifmat.twoseg=[A R K M N H W X];
twoseg=samedifmat.twoseg;
%do the same thing for twosegment and horisegment letters.

samedifmat.horiseg=[L U B C D E G J O Q S Z];
horiseg=samedifmat.horiseg;

samedifmat.oneseg=[F Y I P T V];
oneseg=samedifmat.oneseg;
%% 
% %% trialMatrix
% 
% % 1=1seg, 2=2seg, 3=horiseg
% row1=sort(repmat([1 2 3],1,16));
% 
% % 0= same letter 1= letter + 1seg , 2= letter + 2seg, 3=letter+horiseg
% row2=[repmat([0 0 0 0 1 1 2 3],1,2) repmat([0 0 0 0 2 2 1 3],1,2) repmat([0 0 0 0 3 3 1 2],1,2)];
% 
% row3=[repmat(A,1,8), repmat(R,1,8), repmat(L,1,8), repmat(U,1,8), repmat(F,1,8), repmat(Y,1,8)];
% 
% 
% %col4=[repmat(A,1,4), oneseg(randi([2 length(oneseg)-1])
%    % , repmat(L,1,4),                repmat(F,1,4),
% 
% allrow=[row1;row2];
% 
% 
% 
% Os=0;

%% this part is to create another row, especially to pick "different" group letters randomly.
%% twosegs
    % A group
    triMat=[];
    
    triMat=[triMat repmat(twoseg(1),1,4)]; %selects A and puts it in the matrix for the "same" trials.
        
    twoseg2=twoseg; %creates another variable to keep the oneseg intact
    twoseg2(1)=[]; %removes A from it.
    randselector=randi(length(twoseg2)); %selects the index for the next letter from the same group randomly.
    triMat= [triMat twoseg2(randselector)]; %puts the letter in the randomly selected index in our trialmatrix.
    twoseg2(randselector)=[]; %removing that from the new variable so that it doesn't show up again in the same block of trials
    
    randselector=randi(length(twoseg2)); %selecting the index randomly for anything but A. but this time oneseg2 is smaller because we removed one element.
    triMat=[triMat twoseg2(randselector)]; %putting the selected letter to our trialmatrix.
    
    %oneseg2=oneseg; %returns oneseg2 to first version with all letters included.
        
    randselector=randi(length(oneseg)); %randomly chooses one index from 1 segment group.
    triMat=[triMat oneseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    randselector=randi(length(horiseg)); %randomly chooses one index from hori segment group.
    triMat=[triMat horiseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    
    % R group
    
    
    triMat=[triMat repmat(twoseg(2),1,4)]; %selects R and puts it in the matrix for the "same" trials.
    twoseg2=twoseg; %creates another variable to keep the oneseg intact
    twoseg2(2)=[]; %removes R from it.
    randselector=randi(length(twoseg2)); %selects the index for the next letter from the same group randomly.
    triMat=[triMat twoseg2(randselector)]; %puts the letter in the randomly selected index in our trialmatrix.
    twoseg2(randselector)=[]; %removing that from the new variable so that it doesn't show up again in the same block of trials
    
    randselector=randi(length(twoseg2)); %selecting the index randomly for anything but R. but this time oneseg2 is smaller because we removed one element.
    triMat=[triMat twoseg2(randselector)]; %putting the selected letter to our trialmatrix.
    
    twoseg2=twoseg; %returns oneseg2 to first version with all letters included.
    
    randselector=randi(length(oneseg)); %randomly chooses one index from 1 segment group.
    triMat=[triMat oneseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    randselector=randi(length(horiseg)); %randomly chooses one index from hori segment group.
    triMat=[triMat horiseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    %% horisegs
    
    % L group
    triMat=[triMat repmat(horiseg(1),1,4)]; %selects L and puts it in the matrix for the "same" trials.
        
    horiseg2=horiseg; %creates another variable to keep the horiseg intact
    horiseg2(1)=[]; %removes L from it.
    randselector=randi(length(horiseg2)); %selects the index for the next letter from the same group randomly.
    triMat= [triMat horiseg2(randselector)]; %puts the letter in the randomly selected index in our trialmatrix.
    horiseg2(randselector)=[]; %removing that from the new variable so that it doesn't show up again in the same block of trials
    
    randselector=randi(length(horiseg2)); %selecting the index randomly for anything but L. but this time twoseg2 is smaller because we removed one element.
    triMat=[triMat horiseg2(randselector)]; %putting the selected letter to our trialmatrix.
    
    horiseg2=horiseg; %returns oneseg2 to first version with all letters included.
        
    randselector=randi(length(oneseg)); %randomly chooses one index from 1 segment group.
    triMat=[triMat oneseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    randselector=randi(length(twoseg)); %randomly chooses one index from 2 segment group.
    triMat=[triMat twoseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    
    %U group
    triMat=[triMat repmat(horiseg(2),1,4)]; %selects U and puts it in the matrix for the "same" trials.
    horiseg2=horiseg; %creates another variable to keep the horiseg intact
    horiseg2(2)=[]; %removes R from it.
    randselector=randi(length(horiseg2)); %selects the index for the next letter from the same group randomly.
    triMat=[triMat horiseg2(randselector)]; %puts the letter in the randomly selected index in our trialmatrix.
    horiseg2(randselector)=[]; %removing that from the new variable so that it doesn't show up again in the same block of trials
    
    randselector=randi(length(horiseg2)); %selecting the index randomly for anything but U but this time twoseg2 is smaller because we removed one element.
    triMat=[triMat horiseg2(randselector)]; %putting the selected letter to our trialmatrix.
    
    horiseg2=horiseg; %returns oneseg2 to first version with all letters included.
    
    randselector=randi(length(oneseg)); %randomly chooses one index from 1 segment group.
    triMat=[triMat oneseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    randselector=randi(length(twoseg)); %randomly chooses one index from 2 segment group.
    triMat=[triMat twoseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    %% onesegs
    
    %F group
    triMat=[triMat repmat(oneseg(1),1,4)]; %selects F and puts it in the matrix for the "same" trials.
        
    oneseg2=oneseg; %creates another variable to keep the oneseg intact
    oneseg2(1)=[]; %removes Lfrom it.
    randselector=randi(length(oneseg2)); %selects the index for the next letter from the same group randomly.
    triMat= [triMat oneseg2(randselector)]; %puts the letter in the randomly selected index in our trialmatrix.
    oneseg2(randselector)=[]; %removing that from the new variable so that it doesn't show up again in the same block of trials
    
    randselector=randi(length(oneseg2)); %selecting the index randomly for anything but F. but this time horiseg2 is smaller because we removed one element.
    triMat=[triMat oneseg2(randselector)]; %putting the selected letter to our trialmatrix.
    
    oneseg2=oneseg; %returns oneseg2 to first version with all letters included.
        
    randselector=randi(length(twoseg)); %randomly chooses one index from 2 segment group.
    triMat=[triMat twoseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    randselector=randi(length(horiseg)); %randomly chooses one index from hori segment group.
    triMat=[triMat horiseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    %Y group
    triMat=[triMat repmat(oneseg(2),1,4)]; %selects Y and puts it in the matrix for the "same" trials.
    oneseg2=oneseg; %creates another variable to keep the oneseg intact
    oneseg2(2)=[]; %removes R from it.
    randselector=randi(length(oneseg2)); %selects the index for the next letter from the same group randomly.
    triMat=[triMat oneseg2(randselector)]; %puts the letter in the randomly selected index in our trialmatrix.
    oneseg2(randselector)=[]; %removing that from the new variable so that it doesn't show up again in the same block of trials
    
    randselector=randi(length(oneseg2)); %selecting the index randomly for anything but Y. but this time horiseg2 is smaller because we removed one element.
    triMat=[triMat oneseg2(randselector)]; %putting the selected letter to our trialmatrix.
    
    oneseg2=oneseg; %returns oneseg2 to first version with all letters included.
    
    randselector=randi(length(twoseg)); %randomly chooses one index from 1 segment group.
    triMat=[triMat twoseg(randselector)]; %puts the letter in that index into trialMatrix.
    
    randselector=randi(length(horiseg)); %randomly chooses one index from hori segment group.
    triMat=[triMat horiseg(randselector)]; %puts the letter in that index into trialMatrix.
   
    
    triMat=[repmat(A,1,8) repmat(R,1,8) repmat(L,1,8) repmat(U,1,8) repmat(F,1,8) repmat(Y,1,8); triMat; ...
        repmat({0},1,4), {2}, {2}, {1}, {3}, repmat({0},1,4), {2}, {2}, {1}, {3}, repmat({0},1,4), {3}, {3}, {1}, {2}, ...
        repmat({0},1,4), {3}, {3}, {1}, {2}, repmat({0},1,4), {1}, {1}, {2}, {3}, repmat({0},1,4), {1}, {1}, {2}, {3}; ...
        repmat({2},1,16), repmat({3},1,16), repmat({1},1,16)];
    
    Agrp=triMat(1:4,1:8);
    Shuffler=Shuffle(1:8);
    Agrp=Agrp(:,Shuffler);
    
    Rgrp=triMat(1:4,9:16);
    Shuffler=Shuffle(1:8);
    Rgrp=Rgrp(:,Shuffler);
    
    Lgrp=triMat(1:4,17:24);
    Shuffler=Shuffle(1:8);
    Lgrp=Lgrp(:,Shuffler);
    
    Ugrp=triMat(1:4,25:32);
    Shuffler=Shuffle(1:8);
    Ugrp=Ugrp(:,Shuffler);
    
    Fgrp=triMat(1:4,33:40);
    Shuffler=Shuffle(1:8);
    Fgrp=Fgrp(:,Shuffler);
    
    Ygrp=triMat(1:4,41:end);
    Shuffler=Shuffle(1:8);
    Ygrp=Ygrp(:,Shuffler);
    
    
    triMat=[Agrp Rgrp Lgrp Ugrp Fgrp Ygrp];
      
    triMatRND=[];
    for i=1:8
        triMatRND1=[];
        triMatRND1=[triMatRND1 triMat(1:4,i)];
        triMatRND1=[triMatRND1 triMat(1:4,i+8)];
        triMatRND1=[triMatRND1 triMat(1:4,i+16)];
        triMatRND1=[triMatRND1 triMat(1:4,i+24)];
        triMatRND1=[triMatRND1 triMat(1:4,i+32)];
        triMatRND1=[triMatRND1 triMat(1:4,i+40)];
        Shuffler=Shuffle(1:6);
        triMatRND1=triMatRND1(:,Shuffler);
        triMatRND=[triMatRND triMatRND1];        
    end
    
    save(output2,'triMatRND');
    xlswrite(output, transpose(triMatRND))
    fclose('all');
    