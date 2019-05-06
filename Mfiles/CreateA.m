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
movinga=fopen([pwd filesep 'Static' filesep 'A-Static.txt'],'w');
elseif opt == 2
movinga=fopen([pwd filesep 'PixByPix' filesep 'A-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movinga=fopen([pwd filesep 'PieceByPiece' filesep 'A-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageA=zeros(20,20); 
i=18;
x=4;
num=1;
for j=3:10
    for a=1:framerate
    imageA(i,j)=255;
    imageA(i-1,j)=255;
        if opt == 2 
        fwrite(movinga, transpose(imageA));
        end
    %num=num+1;
	%imshow(imageA);
    end
    i=i-2;
end
if opt == 3
    for a=1:framerate
    fwrite(movinga, transpose(imageA));
    end
end
for a=1:framerate
    imageA(3,10)=255;
    imageA(3,11)=255;
    if opt == 2
        fwrite(movinga, transpose(imageA));
    end
    %num=num+1;
    %imshow(imageA);
end
if opt == 3
    for a=1:framerate
    fwrite(movinga, transpose(imageA));
    end
end
   %imageA(3,10)=1;

for j=11:18
    for a=1:framerate
    imageA(x,j)=255;
    imageA(x-1,j)=255;
    if opt == 2
        fwrite(movinga, transpose(imageA));
    end
    %num=num+1;
    %imshow(imageA);
    end
    x=x+2;
end
if opt == 3
    for a=1:framerate
    fwrite(movinga, transpose(imageA));
    end
end
for i = 6:14
    for a=1:framerate+2
    imageA(12,i)=255;
    if opt == 2
        fwrite(movinga, transpose(imageA));
    end
    %num=num+1;
    %imshow(imageA);
    end
end
if opt == 3
    for a=1:framerate
    fwrite(movinga, transpose(imageA));
    end
end
imageA=transpose(imageA);
imshow(transpose(imageA));

if opt == 1
fwrite(movinga,imageA);
end
imageA2=transpose(imageA);

