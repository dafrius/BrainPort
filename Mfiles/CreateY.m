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
movy=fopen([pwd filesep 'Static' filesep 'Y-Static.txt'],'w');
elseif opt == 2
movy=fopen([pwd filesep 'PixByPix' filesep 'Y-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movy=fopen([pwd filesep 'PieceByPiece' filesep 'Y-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageY=zeros(20,20); 



x=3;
for j=3:2:10
    for fr=1:framerate+2
    imageY(x,j)=255;
    imageY(x+1,j+1)=255;
    if opt == 2
    fwrite(movy, transpose(imageY));
    %imshow(imageY);
    end
    end
    x=x+2;
end

if opt == 3
    for fr=1:framerate
    fwrite(movy, transpose(imageY));
    %imshow(imageY);
    end
end
x=17;
for j=4:2:10
    for fr=1:framerate+2
    imageY(j,x)=255;
    imageY(j-1,x+1)=255;
    if opt == 2
    fwrite(movy, transpose(imageY));
    %imshow(imageY);
    end
    end
    x=x-2;
    if x<3
        break
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movy, transpose(imageY));
    %imshow(imageY);
    end
end

for i=11:18
    for fr=1:framerate
    imageY(i,10)=255;
    imageY(i,11)=255;
    if opt == 2
    fwrite(movy, transpose(imageY));
    %imshow(imageY);
    end
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movy, transpose(imageY));
    %imshow(imageY);
    end
end
if opt == 1
    fwrite(movy, transpose(imageY));
end