clear all
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
movc=fopen([pwd filesep 'Static' filesep 'C-Static.txt'],'w');
elseif opt == 2
movc=fopen([pwd filesep 'PixByPix' filesep 'C-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movc=fopen([pwd filesep 'PieceByPiece' filesep 'C-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageC=zeros(20,20); %image for stimulation of back of tongue

tlcenterx=10;
tlcentery=10;
trcenterx=11;
trcentery=10;
blcenterx=10;
blcentery=11;
brcenterx=11;
brcentery=11;

for j=16:-1:9
    for fr=1:framerate
    imageC(3:4,j)=255;
    if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
    end
end
if opt == 3
    for fr=1:framerate
    fwrite(movc, transpose(imageC));
    end
end
%Topleft
for i=1:framerate
imageC(tlcentery-7,tlcenterx)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end

for i=1:framerate
imageC(tlcentery-7,tlcenterx-1)=255;
    if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end
for i=1:framerate
imageC(tlcentery-6,tlcenterx-2)=255;
    if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end
for i=1:framerate
imageC(tlcentery-6,tlcenterx-3)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end
for i=1:framerate
imageC(tlcentery-5,tlcenterx-4)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end
for i=1:framerate
imageC(tlcentery-4,tlcenterx-5)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end
for i=1:framerate
imageC(tlcentery-3,tlcenterx-6)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end
for i=1:framerate
imageC(tlcentery-2,tlcenterx-6)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end
for i=1:framerate
imageC(tlcentery-1,tlcenterx-7)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end
for i=1:framerate
imageC(tlcentery,tlcenterx-7)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end

if opt == 3
    for fr=1:framerate
    fwrite(movc, transpose(imageC));
    end
end
%Botleft
for i=1:framerate
imageC(blcentery,blcenterx-7)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end
for i=1:framerate
imageC(blcentery+1,blcenterx-7)=255;    
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end    
for i=1:framerate
imageC(blcentery+2,blcenterx-6)=255;    
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end    
for i=1:framerate
imageC(blcentery+3,blcenterx-6)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end    
for i=1:framerate
imageC(blcentery+4,blcenterx-5)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %num=num+1;
    %imshow(imageC);
end
for i=1:framerate
imageC(blcentery+5,blcenterx-4)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end    
for i=1:framerate
imageC(blcentery+6,blcenterx-3)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end    
for i=1:framerate
imageC(blcentery+6,blcenterx-2)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end    
for i=1:framerate
imageC(blcentery+7,blcenterx-1)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
 end
 %imshow(imageC);
end    
for i=1:framerate
imageC(blcentery+7,blcenterx)=255;
 if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
end  

if opt == 3
    for fr=1:framerate
    fwrite(movc, transpose(imageC));
    end
end

for j=9:16
    for i=1:framerate
    imageC(17:18,j)=255;
    if opt == 2
    fwrite(movc, transpose(imageC));
    end
    %imshow(imageC);
    end
end
if opt == 3
    for fr=1:framerate
    fwrite(movc, transpose(imageC));
    end
end

if opt == 1
    fwrite(movc, transpose(imageC));
end
imshow(imageC);