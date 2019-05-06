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
movingHMRL=fopen([pwd filesep 'Static' filesep 'HMidRL-S-Static.txt'],'w');
elseif opt == 2
movingHMRL=fopen([pwd filesep 'PixByPix' filesep 'HMidRL-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingHMRL=fopen([pwd filesep 'PieceByPiece' filesep 'HMidRL-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgHMRL=zeros(20,20);
num=0;
for x=20:-1:1
    for fr=1:framerate
    imgHMRL(10:11,x)=255;
        if opt == 2
            fwrite(movingHMRL, transpose(imgHMRL));
            num=num+1;
        end
        %imshow(imgHMRL);
    end
end

if opt == 1
fwrite(movingHMRL, transpose(imgHMRL));
imshow(imgHMRL);
end
framecount=num