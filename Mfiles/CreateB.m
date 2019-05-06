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
movb=fopen([pwd filesep 'Static' filesep 'B-Static.txt'],'w');
elseif opt == 2
movb=fopen([pwd filesep 'PixByPix' filesep 'B-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movb=fopen([pwd filesep 'PieceByPiece' filesep 'B-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageB=zeros(20,20); 

for i=3:18
    for fr=1:framerate
    imageB(i,3)=255;
    imageB(i,4)=255;
        if opt == 2
        fwrite(movb, transpose(imageB));
        end
    %imshow(imageB);
    end
end
if opt == 3
    for a=1:framerate
    fwrite(movb, transpose(imageB));
    end
end
for j=3:12
    for fr=1:framerate
    imageB(3:4,j)=255;
        if opt == 2
        fwrite(movb, transpose(imageB));
        end
    if opt == 2
    fwrite(movb, transpose(imageB));
    end
    %imshow(imageB);
    end
end
if opt == 3
    for a=1:framerate
    fwrite(movb, transpose(imageB));
    end
end
for i=5:8
    for fr=1:framerate
    imageB(i,13:14)=255;
        if opt == 2
        fwrite(movb, transpose(imageB));
        end
    %imshow(imageB);
    end
end
if opt == 3
    for a=1:framerate
    fwrite(movb, transpose(imageB));
    end
end
for j=12:-1:3
    for fr=1:framerate
    imageB(9:10,j)=255;
        if opt == 2
        fwrite(movb, transpose(imageB));
        end
    %imshow(imageB);
    end
end
if opt == 3
    for a=1:framerate
    fwrite(movb, transpose(imageB));
    end
end
for i=11:17
    for fr=1:framerate
    imageB(i,13:14)=255;
        if opt == 2
        fwrite(movb, transpose(imageB));
        end
    %imshow(imageB);
    end
end
if opt == 3
    for a=1:framerate
    fwrite(movb, transpose(imageB));
    end
end
for j=12:-1:3
    for fr=1:framerate
    imageB(17:18,j)=255;
        if opt == 2
        fwrite(movb, transpose(imageB));
        end
    %
    end
end
if opt == 3
    for a=1:framerate
    fwrite(movb, transpose(imageB));
    end
end
if opt == 1
    fwrite(movb, transpose(imageB));
end
imshow(imageB);