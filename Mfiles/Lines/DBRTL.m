clear all
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
movingDBRTL=fopen([pwd filesep 'Static' filesep 'DBRTL-S-Static.txt'],'w');
elseif opt == 2
movingDBRTL=fopen([pwd filesep 'PixByPix' filesep 'DBRTL-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingDBRTL=fopen([pwd filesep 'PieceByPiece' filesep 'DBRTL-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end


imgDBRTL=zeros(20,20);
imgDBRTL(20,20)=255;
num=0;
i=20;
j=20;
for x=1:20
    for fr=1:framerate
    if x==20
        imgDBRTL(1,1)=255;
    else
    imgDBRTL(i,j-1)=255;
    imgDBRTL(i-1,j-1:j)=255;
    end
        if opt == 2
            fwrite(movingDBRTL, transpose(imgDBRTL));
            num=num+1;
        end
        %imshow(imgDBRTL);
    end
    i=i-1;
    j=j-1;
end

if opt == 1
fwrite(movingDBRTL, transpose(imgDBRTL));
imshow(imgDBRTL);
end
framecount=num