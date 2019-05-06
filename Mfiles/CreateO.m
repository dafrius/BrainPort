clear
clearvars

answr1=inputdlg({'Stimtype: 1=Static 2=PixByPix 3=PieceByPiece'},'Enter stimulus drawing type',[1,17] ,{'1'});
opt=str2double(answr1{1});

if opt == 1
     framerate=1;
else
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;
end

if opt == 1
movo=fopen([pwd filesep 'Static' filesep 'O-Static.txt'],'w');
elseif opt == 2
movo=fopen([pwd filesep 'PixByPix' filesep 'O-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movo=fopen([pwd filesep 'PieceByPiece' filesep 'O-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageO=zeros(20,20); 


tlcenterx=10;
tlcentery=10;
trcenterx=11;
trcentery=10;
blcenterx=10;
blcentery=11;
brcenterx=11;
brcentery=11;

%Topleft
for fr=1:framerate    
imageO(tlcentery-7,tlcenterx)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
for fr=1:framerate    
imageO(tlcentery-7,tlcenterx-1)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
%imageO(tlcentery-6,tlcenterx-1)=255; %%%%
%fwrite(movo, transpose(imageO));
    %num=num+1;
    %imshow(imageO)
for fr=1:framerate    
imageO(tlcentery-6,tlcenterx-2)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
for fr=1:framerate  
imageO(tlcentery-6,tlcenterx-3)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end

    %imageO(tlcentery-5,tlcenterx-3)=255; %%
%fwrite(movo, transpose(imageO));
    %num=num+1;
    %%imshow(imageO);
end
for fr=1:framerate    
imageO(tlcentery-5,tlcenterx-4)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end

    %imageO(tlcentery-5,tlcenterx-5)=255; %%
%fwrite(movo, transpose(imageO));
    %num=num+1;
    %%imshow(imageO);
for fr=1:framerate    
imageO(tlcentery-4,tlcenterx-5)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end

    %imageO(tlcentery-4,tlcenterx-6)=255;%%
%fwrite(movo, transpose(imageO));
    %num=num+1;
    %%imshow(imageO);
for fr=1:framerate    
imageO(tlcentery-3,tlcenterx-6)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate
imageO(tlcentery-2,tlcenterx-6)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end

for fr=1:framerate    
imageO(tlcentery-1,tlcenterx-7)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end

for fr=1:framerate   
imageO(tlcentery,tlcenterx-7)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end


if opt == 3
    for fr=1:framerate
        fwrite(movo, transpose(imageO));
    end
end


%Botleft
for fr=1:framerate  
imageO(blcentery,blcenterx-7)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end

for fr=1:framerate  
imageO(blcentery+1,blcenterx-7)=255;    
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(blcentery+2,blcenterx-6)=255;    
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end

for fr=1:framerate  
imageO(blcentery+3,blcenterx-6)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(blcentery+4,blcenterx-5)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate      
imageO(blcentery+5,blcenterx-4)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(blcentery+6,blcenterx-3)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(blcentery+6,blcenterx-2)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(blcentery+7,blcenterx-1)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(blcentery+7,blcenterx)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end


if opt == 3
    for fr=1:framerate
        fwrite(movo, transpose(imageO));
    end
end

%Botright
for fr=1:framerate  
imageO(brcentery+7,brcenterx)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(brcentery+7,brcenterx+1)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(brcentery+6,brcenterx+2)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(brcentery+6,brcenterx+3)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(brcentery+5,brcenterx+4)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(brcentery+4,brcenterx+5)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(brcentery+3,brcenterx+6)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(brcentery+2,brcenterx+6)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(brcentery+1,brcenterx+7)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(brcentery,brcenterx+7)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end


if opt == 3
    for fr=1:framerate
        fwrite(movo, transpose(imageO));
    end
end


%Topright
for fr=1:framerate  
imageO(trcentery-1,trcenterx+7)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(trcentery-2,trcenterx+6)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(trcentery-3,trcenterx+6)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(trcentery-5,trcenterx+4)=255;    
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(trcentery-4,trcenterx+5)=255;    
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(trcentery-6,trcenterx+3)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(trcentery-6,trcenterx+2)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(trcentery-7,trcenterx+1)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(trcentery-7,trcenterx)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end
    
for fr=1:framerate  
imageO(trcentery,trcenterx+7)=255;
    if opt == 2
    fwrite(movo, transpose(imageO));
    %imshow(imageO);
    end
end


if opt == 3
    for fr=1:framerate
        fwrite(movo, transpose(imageO));
    end
end
if opt == 1
        fwrite(movo, transpose(imageO));
end
