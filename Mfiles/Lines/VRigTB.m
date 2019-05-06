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
movingVRigTB=fopen([pwd filesep 'Static' filesep 'VRigTB-S-Static.txt'],'w');
elseif opt == 2
movingVRigTB=fopen([pwd filesep 'PixByPix' filesep 'VRigTB-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingVRigTB=fopen([pwd filesep 'PieceByPiece' filesep 'VRigTB-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgVRTB=zeros(20,20);
num=0;
pix=4;
for x=1:20
    for fr=1:framerate
    imgVRTB(x,19:20)=255;
        if opt == 2
            fwrite(movingVRigTB, transpose(imgVRTB));
            num=num+1;
        end
        %imshow(imgVRTB);
    end
    pix=pix+2;
end

if opt == 1
fwrite(movingVRigTB, transpose(imgVRTB));
imshow(imgVRTB);
end
framecount=num
pixcount=pix