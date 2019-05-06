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
movingDTRBL=fopen([pwd filesep 'Static' filesep 'DTRBL-S-Static.txt'],'w');
elseif opt == 2
movingDTRBL=fopen([pwd filesep 'PixByPix' filesep 'DTRBL-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingDTRBL=fopen([pwd filesep 'PieceByPiece' filesep 'DTRBL-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgDTRBL=zeros(20,20);
imgDTRBL(1,20)=255;
num=0;
i=1;
j=20;
for x=1:20
    for fr=1:framerate
        if x==20
            imgDTRBL(20,1)=255;
        else
        imgDTRBL(i+1,j-1:j)=255;
        imgDTRBL(i,j-1)=255;
        end
        
        if opt == 2
            fwrite(movingDTRBL, transpose(imgDTRBL));
            num=num+1;
        end
        %imshow(imgDTRBL);
    end
    i=i+1;
    j=j-1;
end

if opt == 1
fwrite(movingDTRBL, transpose(imgDTRBL));
imshow(imgDTRBL);
end
framecount=num