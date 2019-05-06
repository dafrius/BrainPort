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
movd=fopen([pwd filesep 'Static' filesep 'D-Static.txt'],'w');
elseif opt == 2
movd=fopen([pwd filesep 'PixByPix' filesep 'D-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movd=fopen([pwd filesep 'PieceByPiece' filesep 'D-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end
imageD=zeros(20,20); %image for stimulation of back of tongue


num=255;
for i=3:18
    for fr=1:framerate
    imageD(i,3)=255;
    imageD(i,4)=255;
    if opt == 2
    fwrite(movd, transpose(imageD));
    end
    %%imshow(imageD);
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movd, transpose(imageD));
    end
end
for j=3:12
    for fr=1:framerate
    imageD(3:4,j)=255;
    if opt == 2
    fwrite(movd, transpose(imageD));
    end
    %imshow(imageD);
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movd, transpose(imageD));
    end
end
for i=5:7
    for fr=1:framerate
    imageD(i,13:14)=255;
    if opt == 2
    fwrite(movd, transpose(imageD));
    end
    %imshow(imageD);
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movd, transpose(imageD));
    end
end
for i=8:9
    for fr=1:framerate
    imageD(i,14:15)=255;
    if opt == 2
    fwrite(movd, transpose(imageD));
    end
    %imshow(imageD);
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movd, transpose(imageD));
    end
end
for i=10:13
    for fr=1:framerate
    imageD(i,14:15)=255;
    if opt == 2
    fwrite(movd, transpose(imageD));
    end
    %imshow(imageD);
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movd, transpose(imageD));
    end
end
for i=14:17
    for fr=1:framerate
    imageD(i,13:14)=255;
    if opt == 2
    fwrite(movd, transpose(imageD));
    end
    %imshow(imageD);
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movd, transpose(imageD));
    end
end
for j=12:-1:3
    for fr=1:framerate
    imageD(17:18,j)=255;
        if opt == 2
        fwrite(movd, transpose(imageD));
        end
    %imshow(imageD);
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movd, transpose(imageD));
    end
end

if opt == 1
    fwrite(movd, transpose(imageD));
end
imshow(imageD);