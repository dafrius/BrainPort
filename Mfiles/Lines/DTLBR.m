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
movingDTLBR=fopen([pwd filesep 'Static' filesep 'DTLBR-S-Static.txt'],'w');
elseif opt == 2
movingDTLBR=fopen([pwd filesep 'PixByPix' filesep 'DTLBR-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingDTLBR=fopen([pwd filesep 'PieceByPiece' filesep 'DTLBR-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgDTLBR=zeros(20,20);
imgDTLBR(1,1)=255;
num=0;
i=1;
j=1;
for x=1:19
    for fr=1:framerate
    imgDTLBR(i,j+1)=255;
    imgDTLBR(i+1,j:j+1)=255;
        if opt == 2
            fwrite(movingDTLBR, transpose(imgDTLBR));
            num=num+1;
        end
        %imshow(imgDTLBR);
    end
    i=i+1;
    j=j+1;
end

if opt == 1
fwrite(movingDTLBR, transpose(imgDTLBR));
imshow(imgDTLBR);
end
framecount=num
ano=1;
barname=['Diabar' num2str(ano) '.png'];
imwrite(imgDTLBR,barname);
