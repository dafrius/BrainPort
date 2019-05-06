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
movn=fopen([pwd filesep 'Static' filesep 'N-Static.txt'],'w');
elseif opt == 2
movn=fopen([pwd filesep 'PixByPix' filesep 'N-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movn=fopen([pwd filesep 'PieceByPiece' filesep 'N-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end


imageN=zeros(20,20); 

%vertical line on the left
num=1;
for i=3:18
    for fr=1:framerate
    imageN(i,3)=255;
    imageN(i,4)=255;
    if opt == 2   
    fwrite(movn, transpose(imageN));
    %imshow(imageN);
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movn, transpose(imageN));
    end
end


i=3;
for j=3:2:17
    for fr=1:framerate+1
    imageN(i,j)=255;
    imageN(i,j+1)=255;
    imageN(i+1,j)=255;
    imageN(i+1,j+1)=255;
    if opt == 2   
    fwrite(movn, transpose(imageN));
    %imshow(imageN);
    end
    end
    i=i+2;
end
if opt == 3
    for fr=1:framerate
        fwrite(movn, transpose(imageN));
    end
end
%vertical line on the right
for i=18:-1:3
    for fr=1:framerate
    imageN(i,18)=255;
    imageN(i,17)=255;
    if opt == 2   
    fwrite(movn, transpose(imageN));
    %imshow(imageN);
    end
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movn, transpose(imageN));
    end
end
if opt == 1
        fwrite(movn, transpose(imageN));
end