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
movingVLftBT=fopen([pwd filesep 'Static' filesep 'VLftBT-S-Static.txt'],'w');
elseif opt == 2
movingVLftBT=fopen([pwd filesep 'PixByPix' filesep 'VLftBT-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingVLftBT=fopen([pwd filesep 'PieceByPiece' filesep 'VLftBT-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgVLBT=zeros(20,20);
num=0;
pix=4;
for x=20:-1:1
    for fr=1:framerate
    imgVLBT(x,1:2)=255;
        if opt == 2
            fwrite(movingVLftBT, transpose(imgVLBT));
            num=num+1;
        end
        %imshow(imgVLBT);
    end
    pix=pix+2;
end

if opt == 1
fwrite(movingVLftBT, transpose(imgVLBT));
imshow(imgVLBT);
end
framecount=num
pixcount=pix