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
moving0430=fopen([pwd filesep 'Static' filesep '0430-S-Static.txt'],'w');
elseif opt == 2
moving0430=fopen([pwd filesep 'PixByPix' filesep '0430-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
moving0430=fopen([pwd filesep 'PieceByPiece' filesep '0430-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

img0430=zeros(20,20);
img0430(10:11,10:11)=255;
num=0;
i=11;
j=11;
for x=1:9
    for fr=1:framerate
    img0430(i,j+1)=255;
    img0430(i+1,j:j+1)=255;
        if opt == 2
            fwrite(moving0430, transpose(img0430));
            num=num+1;
        end
        imshow(img0430);
    end
    i=i+1;
    j=j+1;
end

if opt == 1
fwrite(moving0430, transpose(img0430));
imshow(img0430);
end
framecount=num