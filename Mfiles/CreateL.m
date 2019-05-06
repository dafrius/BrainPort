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
movl=fopen([pwd filesep 'Static' filesep 'L-Static.txt'],'w');
elseif opt == 2
movl=fopen([pwd filesep 'PixByPix' filesep 'L-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movl=fopen([pwd filesep 'PieceByPiece' filesep 'L-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageL=zeros(20,20); 

%vertical line on the left

num=1;
for i=3:18
    for fr=1:framerate
    imageL(i,3)=255;
    imageL(i,4)=255;
    if opt == 2
    fwrite(movl, transpose(imageL));
    end
    %imshow(imageL);
    end
end
if opt == 3
    for fr=1:framerate
    fwrite(movl, transpose(imageL));
    end
end

%horizontal line on the bot
for i=3:18
    for fr=1:framerate
    imageL(17,i)=255;
    imageL(18,i)=255;
    if opt == 2
    fwrite(movl, transpose(imageL));
    end
    %imshow(imageL);
    end
end

if opt == 3
    for fr=1:framerate
    fwrite(movl, transpose(imageL));
    end
end

if opt == 1
    fwrite(movl,transpose(imageL));
end
    %imshow(imageL);