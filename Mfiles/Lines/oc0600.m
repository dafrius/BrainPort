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
moving0600=fopen([pwd filesep 'Static' filesep '0600-S-Static.txt'],'w');
elseif opt == 2
moving0600=fopen([pwd filesep 'PixByPix' filesep '0600-S-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
moving0600=fopen([pwd filesep 'PieceByPiece' filesep '0600-S-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

img0600=zeros(20,20);
img0600(10:11,10:11)=255;
num=0;
pix=4;
i=12;
for x=1:9
    for fr=1:framerate
    img0600(i,10:11)=255;
        if opt == 2
            if mod(x,2) == 1
            fwrite(moving0600, transpose(img0600));
            img0600=zeros(20,20);
            end
            num=num+1;
        end
        
        %imshow(img0600);
    end
    pix=pix+2;
    i=i+1;
end

if opt == 1
fwrite(moving0600, transpose(img0600));
imshow(img0600);
end
framecount=num
pixcount=pix