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
movf=fopen([pwd filesep 'Static' filesep 'F-Static.txt'],'w');
elseif opt == 2
movf=fopen([pwd filesep 'PixByPix' filesep 'F-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movf=fopen([pwd filesep 'PieceByPiece' filesep 'F-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end
imageF=zeros(20,20); 

%vertical line on the left

num=1;
for i=3:18
    for fr=1:framerate
    imageF(i,3)=255;
    imageF(i,4)=255;
    if opt == 2
    fwrite(movf, transpose(imageF));
    end
    end
end
if opt == 3
    for i=1:framerate
        fwrite(movf, transpose(imageF));
    end
end

%horizontal line on top
num=1;
for j=3:18
    for fr=1:framerate
    imageF(3,j)=255;
    imageF(4,j)=255;
    if opt == 2
    fwrite(movf, transpose(imageF));
    end
    end
end
if opt == 3
    for i=1:framerate
        fwrite(movf, transpose(imageF));
    end
end


%horizontal line in the mid
for i=3:13
    for fr=1:framerate
    imageF(10,i)=255;
    imageF(11,i)=255;
    if opt == 2
    fwrite(movf, transpose(imageF));
    end
    end
end
if opt == 3
    for i=1:framerate
        fwrite(movf, transpose(imageF));
    end
end
if opt == 1
        fwrite(movf, transpose(imageF));
end
