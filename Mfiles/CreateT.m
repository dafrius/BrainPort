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
movt=fopen([pwd filesep 'Static' filesep 'T-Static.txt'],'w');
elseif opt == 2
movt=fopen([pwd filesep 'PixByPix' filesep 'T-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movt=fopen([pwd filesep 'PieceByPiece' filesep 'T-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageT=zeros(20,20); 

%horizontal line on top
num=1;
for j=3:18
    for fr=1:framerate
    imageT(3,j)=255;
    imageT(4,j)=255;
    if opt == 2
    fwrite(movt, transpose(imageT));
    %imshow(imageT);
    end
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movt, transpose(imageT));
    end
%imshow(imageT);
end

num=1;
for i=3:18
    for fr=1:framerate
    imageT(i,10)=255;
    imageT(i,11)=255;
    if opt == 2
    fwrite(movt, transpose(imageT));
    %imshow(imageT);
    end
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movt, transpose(imageT));
    end
%imshow(imageT);
end

if opt == 1
    fwrite(movt, transpose(imageT));
%imshow(imageT);
end