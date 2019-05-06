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
movingVMidBT=fopen([pwd filesep 'Static' filesep 'VMidBT-S-Static.txt'],'w');
elseif opt == 2
movingVMidBT=fopen([pwd filesep 'PixByPix' filesep 'VMidBT-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingVMidBT=fopen([pwd filesep 'PieceByPiece' filesep 'VMidBT-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgVMBT=zeros(20,20);
num=0;
pix=4;
for x=20:-1:1
    for fr=1:framerate
    imgVMBT(x,10:11)=255;
        if opt == 2
            fwrite(movingVMidBT, transpose(imgVMBT));
            num=num+1;
        end
        %imshow(imgVMBT);
    end
    pix=pix+2;
end

if opt == 1
fwrite(movingVMidBT, transpose(imgVMBT));
imshow(imgVMBT);
end
framecount=num
pixcount=pix