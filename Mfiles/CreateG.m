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
movg=fopen([pwd filesep 'Static' filesep 'G-Static.txt'],'w');
elseif opt == 2
movg=fopen([pwd filesep 'PixByPix' filesep 'G-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movg=fopen([pwd filesep 'PieceByPiece' filesep 'G-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageG=zeros(20,20); %image for stimulation of back of tongue


num=1;
tlcenterx=10;
tlcentery=10;
trcenterx=11;
trcentery=10;
blcenterx=10;
blcentery=11;
brcenterx=11;
brcentery=11;


for j=15:-1:9
    for fr=1:framerate
    imageG(3:4,j)=255;
    if opt == 2
    fwrite(movg, transpose(imageG));
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movg, transpose(imageG));
    end
end
%Topleft
for fr=1:framerate
imageG(tlcentery-7,tlcenterx)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate    
imageG(tlcentery-7,tlcenterx-1)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate
imageG(tlcentery-6,tlcenterx-2)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end  
for fr=1:framerate    
imageG(tlcentery-6,tlcenterx-3)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate
imageG(tlcentery-5,tlcenterx-4)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate
imageG(tlcentery-4,tlcenterx-5)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate
imageG(tlcentery-3,tlcenterx-6)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate
imageG(tlcentery-2,tlcenterx-6)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate
imageG(tlcentery-1,tlcenterx-7)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate
imageG(tlcentery,tlcenterx-7)=255;
    if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    

if opt == 3
    for fr=1:framerate
        fwrite(movg, transpose(imageG));
    end
end


%Botleft
for fr=1:framerate
imageG(blcentery,blcenterx-7)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(blcentery+1,blcenterx-7)=255;    
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(blcentery+2,blcenterx-6)=255;    
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate
imageG(blcentery+3,blcenterx-6)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate
imageG(blcentery+4,blcenterx-5)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
for fr=1:framerate    
imageG(blcentery+5,blcenterx-4)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(blcentery+6,blcenterx-3)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate    
imageG(blcentery+6,blcenterx-2)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(blcentery+7,blcenterx-1)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(blcentery+7,blcenterx)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movg, transpose(imageG));
    end
end


    %Botright
for fr=1:framerate
imageG(brcentery+7,brcenterx)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(brcentery+7,brcenterx+1)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(brcentery+6,brcenterx+2)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(brcentery+6,brcenterx+3)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(brcentery+5,brcenterx+4)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(brcentery+4,brcenterx+5)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(brcentery+3,brcenterx+6)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(brcentery+2,brcenterx+6)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(brcentery+1,brcenterx+7)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end    
for fr=1:framerate
imageG(brcentery,brcenterx+7)=255;
if opt == 2
    fwrite(movg, transpose(imageG));
    end
end
    

if opt == 3
    for fr=1:framerate
        fwrite(movg, transpose(imageG));
    end
end

for j=18:-1:12
    for fr=1:framerate
    imageG(10:11,j)=255;
    if opt == 2
    fwrite(movg, transpose(imageG));
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movg, transpose(imageG));
    end
end

if opt == 1
        fwrite(movg, transpose(imageG));
end
imshow(imageG);