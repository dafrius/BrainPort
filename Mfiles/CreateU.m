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
movu=fopen([pwd filesep 'Static' filesep 'U-Static.txt'],'w');
elseif opt == 2
movu=fopen([pwd filesep 'PixByPix' filesep 'U-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movu=fopen([pwd filesep 'PieceByPiece' filesep 'U-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end


imageU=zeros(20,20);
blcenterx=10;
blcentery=11;
brcenterx=11;
brcentery=11;


for i=3:12
    for fr=1:framerate
    imageU(i,3)=255;
    imageU(i,4)=255;
    if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movu, transpose(imageU));
    end
end
%Botleft
for fr=1:framerate
imageU(blcentery,blcenterx-7)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(blcentery+1,blcenterx-7)=255;    
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end 
for fr=1:framerate
imageU(blcentery+2,blcenterx-6)=255;    
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(blcentery+3,blcenterx-6)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end
for fr=1:framerate
imageU(blcentery+4,blcenterx-5)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(blcentery+5,blcenterx-4)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
end
end
for fr=1:framerate
imageU(blcentery+6,blcenterx-3)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(blcentery+6,blcenterx-2)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(blcentery+7,blcenterx-1)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
end
end
for fr=1:framerate
imageU(blcentery+7,blcenterx)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end


if opt == 3
    for fr=1:framerate
    fwrite(movu, transpose(imageU));
    end
end

%Botright

for fr=1:framerate
imageU(brcentery+7,brcenterx)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate    
imageU(brcentery+7,brcenterx+1)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(brcentery+6,brcenterx+2)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(brcentery+6,brcenterx+3)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(brcentery+5,brcenterx+4)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(brcentery+4,brcenterx+5)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(brcentery+3,brcenterx+6)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(brcentery+2,brcenterx+6)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(brcentery+1,brcenterx+7)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
for fr=1:framerate
imageU(brcentery,brcenterx+7)=255;
if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
end    
    
if opt == 3
    for fr=1:framerate
    fwrite(movu, transpose(imageU));
    end
end

for i=12:-1:3
    for fr=1:framerate
    imageU(i,18)=255;
    imageU(i,17)=255;
    if opt == 2 
    fwrite(movu, transpose(imageU));
    %imshow(imageU);
    end
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movu, transpose(imageU));
    end
end

if opt == 1
    fwrite(movu, transpose(imageU));
end