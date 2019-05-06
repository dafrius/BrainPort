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
movr=fopen([pwd filesep 'Static' filesep 'R-Static.txt'],'w');
elseif opt == 2
movr=fopen([pwd filesep 'PixByPix' filesep 'R-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movr=fopen([pwd filesep 'PieceByPiece' filesep 'R-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageR=zeros(20,20); 


num=1;
for i=3:18
    for fr=1:framerate
    imageR(i,3)=255;
    imageR(i,4)=255;
    if opt == 2
    fwrite(movr, transpose(imageR));
    %imshow(imageR);
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movr, transpose(imageR));
    end
end


for j=3:12
    for fr=1:framerate
    imageR(3:4,j)=255;
        if opt == 2
        fwrite(movr, transpose(imageR));
        %imshow(imageR);
        end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movr, transpose(imageR));
    end
end

for i=5:8
    for fr=1:framerate
    imageR(i,13:14)=255;
        if opt == 2
        fwrite(movr, transpose(imageR));
        %imshow(imageR);
        end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movr, transpose(imageR));
    end
end

for j=12:-1:3
    for fr=1:framerate
    imageR(9:10,j)=255;
        if opt == 2
        fwrite(movr, transpose(imageR));
        %imshow(imageR);
        end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movr, transpose(imageR));
    end
end


for i=11:18
    for fr=1:framerate
    imageR(i,13:14)=255;
        if opt == 2
        fwrite(movr, transpose(imageR));
        %imshow(imageR);
        end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movr, transpose(imageR));
    end
end

if opt == 1
        fwrite(movr, transpose(imageR));
end