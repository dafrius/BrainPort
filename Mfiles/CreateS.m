clear
clearvars

imageS=zeros(20,20); 

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
movs=fopen([pwd filesep 'Static' filesep 'S-Static.txt'],'w');
elseif opt == 2
movs=fopen([pwd filesep 'PixByPix' filesep 'S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movs=fopen([pwd filesep 'PieceByPiece' filesep 'S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end


%horizontal line on top
for j=16:-1:5
    for fr=1:framerate
    imageS(3,j)=255;
    imageS(4,j)=255;
    if opt == 2
    fwrite(movs, transpose(imageS));
    %imshow(imageS);
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movs, transpose(imageS));
    end
end

%vertical line on the left
for i=3:10
    for fr=1:framerate
    imageS(i,5)=255;
    imageS(i,6)=255;
    if opt == 2
    fwrite(movs, transpose(imageS));
    %imshow(imageS);
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movs, transpose(imageS));
    end
end


%horizontal line in the mid
for i=5:16
    for fr=1:framerate
    imageS(10,i)=255;
    imageS(11,i)=255;
    if opt == 2
    fwrite(movs, transpose(imageS));
    %imshow(imageS);
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movs, transpose(imageS));
    end
end


%vertical line on the right
for i=11:18
    for fr=1:framerate
    imageS(i,16)=255;
    imageS(i,15)=255;
    if opt == 2
    fwrite(movs, transpose(imageS));
    %imshow(imageS);
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movs, transpose(imageS));
    end
end


%horizontal line on the bot
for i=16:-1:5
    for fr=1:framerate
    imageS(17,i)=255;
    imageS(18,i)=255;
    if opt == 2
    fwrite(movs, transpose(imageS));
    %imshow(imageS);
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movs, transpose(imageS));
    end
end

if opt == 1
        fwrite(movs, transpose(imageS));
end
