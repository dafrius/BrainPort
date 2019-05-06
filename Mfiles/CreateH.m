clear
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
movh=fopen([pwd filesep 'Static' filesep 'H-Static.txt'],'w');
elseif opt == 2
movh=fopen([pwd filesep 'PixByPix' filesep 'H-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movh=fopen([pwd filesep 'PieceByPiece' filesep 'H-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end


imageH=zeros(20,20); %image for stimulation of back of tongue

%vertical line on the left
num=1;
for i=3:18
    for fr=1:framerate
    imageH(i,3)=255;
    imageH(i,4)=255;
    if opt == 2
    fwrite(movh, transpose(imageH));
    end
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movh,transpose(imageH));
    end
end

%horizontal line in the mid
for i=3:18
    for fr=1:framerate
    imageH(10,i)=255;
    imageH(11,i)=255;
    if opt == 2
    fwrite(movh, transpose(imageH));
    end
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movh,transpose(imageH));
    end
end

%vertical line on the right
for i=3:18
    for fr=1:framerate
    imageH(i,18)=255;
    imageH(i,17)=255;
    if opt == 2
    fwrite(movh, transpose(imageH));
    end
    end
end
if opt == 3
    for fr=1:framerate
    fwrite(movh,transpose(imageH));
    end
end
if opt == 1
    fwrite(movh,transpose(imageH));
end

