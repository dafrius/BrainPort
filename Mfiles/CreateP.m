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
movp=fopen([pwd filesep 'Static' filesep 'P-Static.txt'],'w');
elseif opt == 2
movp=fopen([pwd filesep 'PixByPix' filesep 'P-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movp=fopen([pwd filesep 'PieceByPiece' filesep 'P-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageP=zeros(20,20); %image for stimulation of back of tongue


num=1;
for i=3:18
    for fr=1:framerate
    imageP(i,3)=255;
    imageP(i,4)=255;
        if opt == 2
        fwrite(movp, transpose(imageP));
        %imshow(imageP);
        end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movp, transpose(imageP));
    end
end


for j=3:12
    for fr=1:framerate
    imageP(3:4,j)=255;
        if opt == 2
        fwrite(movp, transpose(imageP));
        %imshow(imageP);
        end
    end
end


if opt == 3
    for fr=1:framerate
        fwrite(movp, transpose(imageP));
    end
end

for i=5:8
    for fr=1:framerate
    imageP(i,13:14)=255;
        if opt == 2
        fwrite(movp, transpose(imageP));
        %imshow(imageP);
        end
    end
end


if opt == 3
    for fr=1:framerate
        fwrite(movp, transpose(imageP));
    end
end

for j=12:-1:3
    for fr=1:framerate
    imageP(9:10,j)=255;
        if opt == 2
        fwrite(movp, transpose(imageP));
        %imshow(imageP);
        end
    end
end


if opt == 3
    for fr=1:framerate
        fwrite(movp, transpose(imageP));
    end
end

if opt == 1
        fwrite(movp, transpose(imageP));
end
