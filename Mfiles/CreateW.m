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
movw=fopen([pwd filesep 'Static' filesep 'W-Static.txt'],'w');
elseif opt == 2
movw=fopen([pwd filesep 'PixByPix' filesep 'W-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movw=fopen([pwd filesep 'PieceByPiece' filesep 'W-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageW=zeros(20,20); 


for i=3:18
    for fr=1:framerate
    imageW(i,3)=255;
    imageW(i,4)=255;
    if opt == 2
    fwrite(movw, transpose(imageW));
    %imshow(imageW);
    end
    end
end

    if opt == 3
        for fr=1:framerate
    fwrite(movw, transpose(imageW));
    %imshow(imageW);
        end
    end

i=17;
for j=3:10
    for fr=1:framerate
        imageW(i,j)=255;
        imageW(i+1,j)=255;
        if i<16
        imageW(i+2,j)=255;
        end
            if opt == 2
            fwrite(movw, transpose(imageW));
            %imshow(imageW);
            end
    end
    i=i-2;
end

if opt == 3
        for fr=1:framerate
    fwrite(movw, transpose(imageW));
    %imshow(imageW);
        end
end

i=3;
for j=11:17
    for fr=1:framerate
        imageW(i,j)=255;
        imageW(i+1,j)=255;
        imageW(i+2,j)=255;
            if opt == 2
            fwrite(movw, transpose(imageW));
            %imshow(imageW);
            end
    end
    i=i+2;
end

if opt == 3
        for fr=1:framerate
    fwrite(movw, transpose(imageW));
    %imshow(imageW);
        end
end

for i=18:-1:3
    for fr=1:framerate
    imageW(i,17)=255;
    imageW(i,18)=255;
        if opt == 2
        fwrite(movw, transpose(imageW));
        %imshow(imageW);
        end
    end
end

if opt == 3
        for fr=1:framerate
    fwrite(movw, transpose(imageW));
    %imshow(imageW);
        end
end

if opt == 1
    fwrite(movw, transpose(imageW));
    %imshow(imageW);
end