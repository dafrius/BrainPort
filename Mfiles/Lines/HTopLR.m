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
movingHTLR=fopen([pwd filesep 'Static' filesep 'HTopLR-S-Static.txt'],'w');
elseif opt == 2
movingHTLR=fopen([pwd filesep 'PixByPix' filesep 'HTopLR-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movingHTLR=fopen([pwd filesep 'PieceByPiece' filesep 'HTopLR-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imgHTLR=zeros(20,20);
num=0;
for x=1:20
    for fr=1:framerate
    imgHTLR(1:2,x)=255;
        if opt == 2
            fwrite(movingHTLR, transpose(imgHTLR));
            
        end
        %imshow(imgHTLR);
    end
    num=num+1;
end

if opt == 1
fwrite(movingHTLR, transpose(imgHTLR));
imshow(imgHTLR);
end
framecount=num