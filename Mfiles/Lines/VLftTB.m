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
movingVLftTB=fopen([pwd filesep 'Static' filesep 'VLftTB-S-Static.txt'],'w');
elseif opt == 2
movingVLftTB=fopen([pwd filesep 'PixByPix' filesep 'VLftTB-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingVLftTB=fopen([pwd filesep 'PieceByPiece' filesep 'VLftTB-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgVLTB=zeros(20,20);
num=0;
pix=4;
for x=1:20
    for fr=1:framerate
    imgVLTB(x,1:2)=255;
        if opt == 2
            fwrite(movingVLftTB, transpose(imgVLTB));
            num=num+1;
        end
        %imshow(imgVLTB);
    end
    pix=pix+2;
end

if opt == 1
fwrite(movingVLftTB, transpose(imgVLTB));
imshow(imgVLTB);
end
framecount=num
pixcount=pix