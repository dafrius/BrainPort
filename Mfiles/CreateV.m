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
movv=fopen([pwd filesep 'Static' filesep 'V-Static.txt'],'w');
elseif opt == 2
movv=fopen([pwd filesep 'PixByPix' filesep 'V-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movv=fopen([pwd filesep 'PieceByPiece' filesep 'V-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageV=zeros(20,20);

x=4;
for j=3:10
    for fr=1:framerate
    imageV(x,j)=255;
    imageV(x+1,j)=255;
    if opt == 2
    fwrite(movv, transpose(imageV));
    %imshow(imageV)
    end
    end
    x=x+2;
    if x>18
        break
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movv, transpose(imageV));
    %imshow(imageV)
    end
end
    
i=18;
for j=11:18
    for fr=1:framerate
    imageV(i,j)=255;
    imageV(i+1,j)=255;
    if opt == 2
    fwrite(movv, transpose(imageV));
    %imshow(imageV)
    end
    end
    i=i-2;
end

if opt == 3
    for fr=1:framerate
    fwrite(movv, transpose(imageV));
    %imshow(imageV)
    end
end

if opt == 1
    fwrite(movv, transpose(imageV));
end
    
