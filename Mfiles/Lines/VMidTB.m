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
movingVMidTB=fopen([pwd filesep 'Static' filesep 'VMidTB-S-Static.txt'],'w');
elseif opt == 2
movingVMidTB=fopen([pwd filesep 'PixByPix' filesep 'VMidTB-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingVMidTB=fopen([pwd filesep 'PieceByPiece' filesep 'VMidTB-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgVMTB=zeros(20,20);
num=0;
pix=4;
for x=1:20
    for fr=1:framerate
    imgVMTB(x,10:11)=255;
        if opt == 2
            fwrite(movingVMidTB, transpose(imgVMTB));
            num=num+1;
        end
        %imshow(imgVMTB);
    end
    pix=pix+2;
end

if opt == 1
fwrite(movingVMidTB, transpose(imgVMTB));
imshow(imgVMTB);
end
framecount=num
pixcount=pix