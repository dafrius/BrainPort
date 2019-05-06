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
movingHMLR=fopen([pwd filesep 'Static' filesep 'HMidLR-S-Static.txt'],'w');
elseif opt == 2
movingHMLR=fopen([pwd filesep 'PixByPix' filesep 'HMidLR-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingHMLR=fopen([pwd filesep 'PieceByPiece' filesep 'HMidLR-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgHMLR=zeros(20,20);
num=0;
for x=1:20
    for fr=1:framerate
    imgHMLR(10:11,x)=255;
        if opt == 2
            fwrite(movingHMLR, transpose(imgHMLR));
            num=num+1;
        end
        %imshow(imgHMLR);
    end
end

if opt == 1
fwrite(movingHMLR, transpose(imgHMLR));
imshow(imgHMLR);
end
framecount=num