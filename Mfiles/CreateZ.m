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
movz=fopen([pwd filesep 'Static' filesep 'Z-Static.txt'],'w');
elseif opt == 2
movz=fopen([pwd filesep 'PixByPix' filesep 'Z-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movz=fopen([pwd filesep 'PieceByPiece' filesep 'Z-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageZ=zeros(20,20); %image for stimulation of back of tongue


%horizontal line on top

for j=3:18
    for fr=1:framerate
    imageZ(3,j)=255;
    imageZ(4,j)=255;
    if opt == 2
    fwrite(movz, transpose(imageZ));
    %imshow(imageZ);
    end
    end
end

    if opt == 3
        for fr=1:framerate
    fwrite(movz, transpose(imageZ));
    %imshow(imageZ);
        end
    end

%diag-topleft-botright
i=18;
i=3;

for j=18:-2:3
    for fr=1:framerate*2
    imageZ(i,j)=255;
    imageZ(i,j-1)=255;
    imageZ(i+1,j)=255;
    imageZ(i+1,j-1)=255;
    if opt == 2
    fwrite(movz, transpose(imageZ));
    %imshow(imageZ);
    end
    end
    i=i+2;    
end

if opt == 3
        for fr=1:framerate
    fwrite(movz, transpose(imageZ));
    %imshow(imageZ);
        end
end

%horizontal line on the bot
for i=3:18
    for fr=1:framerate
    imageZ(17,i)=255;
    imageZ(18,i)=255;
    if opt == 2
    fwrite(movz, transpose(imageZ));
    %imshow(imageZ);
    end
    end
end

if opt == 3
        for fr=1:framerate
    fwrite(movz, transpose(imageZ));
    %imshow(imageZ);
        end
end

if opt == 1
    fwrite(movz, transpose(imageZ));
end