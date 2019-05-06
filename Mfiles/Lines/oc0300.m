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
moving0300=fopen([pwd filesep 'Static' filesep '0300-S-Static.txt'],'w');
elseif opt == 2
moving0300=fopen([pwd filesep 'PixByPix' filesep '0300-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
moving0300=fopen([pwd filesep 'PieceByPiece' filesep '0300-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

img0300=zeros(20,20);
img0300(10:11,10:11)=255;
num=0;
for j=12:20
    for fr=1:framerate
    img0300(10:11,j)=255;
        if opt == 2
            fwrite(moving0300, transpose(img0300));
            num=num+1;
        end
        imshow(img0300);
    end
        
end

if opt == 1
fwrite(moving0300, transpose(img0300));
imshow(img0300);
end
framecount=num