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
moving0130=fopen([pwd filesep 'Static' filesep '0130-S-Static.txt'],'w');
elseif opt == 2
moving0130=fopen([pwd filesep 'PixByPix' filesep '0130-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
moving0130=fopen([pwd filesep 'PieceByPiece' filesep '0130-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

img0130=zeros(20,20);
img0130(10:11,10:11)=255;
num=0;
i=10;
j=12;
for x=1:9
    for fr=1:framerate
    img0130(i-1,j-1:j)=255;
    img0130(i,j)=255;
        if opt == 2
            fwrite(moving0130, transpose(img0130));
            num=num+1;
        end
        imshow(img0130);
    end
    i=i-1;
    j=j+1;
end

if opt == 1
fwrite(moving0130, transpose(img0130));
imshow(img0130);
end
framecount=num