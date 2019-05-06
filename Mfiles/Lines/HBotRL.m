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
movingHBRL=fopen([pwd filesep 'Static' filesep 'HBotRL-S-Static.txt'],'w');
elseif opt == 2
movingHBRL=fopen([pwd filesep 'PixByPix' filesep 'HBotRL-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingHBRL=fopen([pwd filesep 'PieceByPiece' filesep 'HBotRL-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgHBRL=zeros(20,20);
num=0;
for x=20:-1:1
    for fr=1:framerate
    imgHBRL(19:20,x)=255;
        if opt == 2
            fwrite(movingHBRL, transpose(imgHBRL));
            
        end
        %imshow(imgHBRL);
    end
    num=num+1;
end

if opt == 1
fwrite(movingHBRL, transpose(imgHBRL));
imshow(imgHBRL);
end
framecount=num