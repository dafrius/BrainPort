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
moving1030=fopen([pwd filesep 'Static' filesep '1030-S-Static.txt'],'w');
elseif opt == 2
moving1030=fopen([pwd filesep 'PixByPix' filesep '1030-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
moving1030=fopen([pwd filesep 'PieceByPiece' filesep '1030-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

img1030=zeros(20,20);
img1030(10:11,10:11)=255;
num=0;
i=10;
j=10;
for x=1:9
    for fr=1:framerate
    img1030(i,j-1)=255;
    img1030(i-1,j-1:j)=255;
        if opt == 2
            fwrite(moving1030, transpose(img1030));
            num=num+1;
        end
        imshow(img1030);
    end
    i=i-1;
    j=j-1;
end

if opt == 1
fwrite(moving1030, transpose(img1030));
imshow(img1030);
end
framecount=num