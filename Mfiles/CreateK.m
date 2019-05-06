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
movk=fopen([pwd filesep 'Static' filesep 'K-Static.txt'],'w');
elseif opt == 2
movk=fopen([pwd filesep 'PixByPix' filesep 'K-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movk=fopen([pwd filesep 'PieceByPiece' filesep 'K-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end
imageK=zeros(20,20); 


%vertical line on the left
for i=3:18
    for fr=1:framerate
    imageK(i,3)=255;
    imageK(i,4)=255;
    if opt == 2
    fwrite(movk, transpose(imageK));
    end
    %imshow(imageK);
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movk, transpose(imageK));
    end
end

j=11;
for i=4:2:10
    for fr=1:framerate*2
    imageK(i,j)=255;
    imageK(i-1,j+1)=255;
    imageK(i-1,j+2)=255;
    if opt == 2
    fwrite(movk, transpose(imageK));
    end
    %imshow(imageK);
    end
    j=j-2;
    if j<3
        break
    end
end
if opt == 3
    for fr=1:framerate
        fwrite(movk, transpose(imageK));
    end
end
j=3;
for i=9:2:18
    if j>10
        imageK(17,11)=255;
        imageK(18,12:13)=255;
        if opt == 2
            for fr=1:framerate*2
        fwrite(movk, transpose(imageK));
            end
        end
        break
    %imshow(imageK);
    end
    for fr=1:framerate*2
    imageK(i,j)=255;
    imageK(i+1,j+1)=255;
    imageK(i+1,j+2)=255;
    if opt == 2
    fwrite(movk, transpose(imageK));
    end
    %imshow(imageK);
    end
    j=j+2;
    
end
if opt == 3
    for fr=1:framerate
        fwrite(movk, transpose(imageK));
    end
end
if opt == 1
        fwrite(movk, transpose(imageK));
end