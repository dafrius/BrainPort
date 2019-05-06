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
movj=fopen([pwd filesep 'Static' filesep 'J-Static.txt'],'w');
elseif opt == 2
movj=fopen([pwd filesep 'PixByPix' filesep 'J-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movj=fopen([pwd filesep 'PieceByPiece' filesep 'J-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end
imageJ=zeros(20,20);
num=1;
tlcenterx=10;
tlcentery=10;
trcenterx=11;
trcentery=10;
blcenterx=10;
blcentery=11;
brcenterx=11;
brcentery=11;



for j=14:18
    for fr=1:framerate
    imageJ(3:4,j)=255;
    if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movj, transpose(imageJ));
    end
end
for i=3:12
    for fr=1:framerate
    imageJ(i,17:18)=255;
    if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movj, transpose(imageJ));
    end
end



%BotrightInversed

for fr=1:framerate
imageJ(brcentery,brcenterx+7)=255;
    if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate
imageJ(brcentery+1,brcenterx+7)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end
for fr=1:framerate
imageJ(brcentery+2,brcenterx+6)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end
for fr=1:framerate
imageJ(brcentery+3,brcenterx+6)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(brcentery+4,brcenterx+5)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate
imageJ(brcentery+5,brcenterx+4)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
end
end    
for fr=1:framerate    
imageJ(brcentery+6,brcenterx+3)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(brcentery+6,brcenterx+2)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(brcentery+7,brcenterx+1)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(brcentery+7,brcenterx)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
    
if opt == 3
    for fr=1:framerate
        fwrite(movj, transpose(imageJ));
    end
end

    %Botleftinversed
for fr=1:framerate    
imageJ(blcentery+7,blcenterx)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end
for fr=1:framerate    
imageJ(blcentery+7,blcenterx-1)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end
for fr=1:framerate    
imageJ(blcentery+6,blcenterx-2)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(blcentery+6,blcenterx-3)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(blcentery+5,blcenterx-4)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(blcentery+4,blcenterx-5)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(blcentery+3,blcenterx-6)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(blcentery+2,blcenterx-6)=255;    
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(blcentery+1,blcenterx-7)=255;    
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end    
for fr=1:framerate    
imageJ(blcentery,blcenterx-7)=255;
if opt == 2
    fwrite(movj, transpose(imageJ));
    end
    %imshow(imageJ);
end

if opt == 3
    for fr=1:framerate
        fwrite(movj, transpose(imageJ));
    end
end

if opt == 1
        fwrite(movj, transpose(imageJ));
end