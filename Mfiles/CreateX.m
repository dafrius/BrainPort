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
movx=fopen([pwd filesep 'Static' filesep 'X-Static.txt'],'w');
elseif opt == 2
movx=fopen([pwd filesep 'PixByPix' filesep 'X-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movx=fopen([pwd filesep 'PieceByPiece' filesep 'X-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageX=zeros(20,20); 


i=3;
for j=3:2:17
    for fr=1:framerate
    imageX(i,j)=255;
    imageX(i,j+1)=255;
    imageX(i+1,j)=255;
    imageX(i+1,j+1)=255;
    
    if opt == 2
    fwrite(movx, transpose(imageX));
    %imshow(imageX);
    end
    
    end
    i=i+2;
end

if opt == 3
    for fr=1:framerate
    fwrite(movx, transpose(imageX));
    %imshow(imageX);
    end
end

i=3;

for j=18:-2:3
    for fr=1:framerate
    imageX(i,j)=255;
    imageX(i,j-1)=255;
    imageX(i+1,j)=255;
    imageX(i+1,j-1)=255;
    if opt == 2
    fwrite(movx, transpose(imageX));
    %imshow(imageX);
    end
    end
    i=i+2;
end

if opt == 3
    for fr=1:framerate
    fwrite(movx, transpose(imageX));
    %imshow(imageX);
    end
end

if opt == 1
    fwrite(movx, transpose(imageX));
end