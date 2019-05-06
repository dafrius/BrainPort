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
move=fopen([pwd filesep 'Static' filesep 'E-Static.txt'],'w');
elseif opt == 2
move=fopen([pwd filesep 'PixByPix' filesep 'E-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
move=fopen([pwd filesep 'PieceByPiece' filesep 'E-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end
imageE=zeros(20,20); %image for stimulation of back of tongue


%vertical line on the left

num=1;
for i=3:18
    for fr=1:framerate
    imageE(i,3)=255;
    imageE(i,4)=255;
    if opt == 2
    fwrite(move, transpose(imageE));
    end
    %imshow(imageE);
    end
end
if opt == 3
    for fr=1:framerate
    fwrite(move,transpose(imageE));
    end
end

%horizontal line on top
num=1;
for j=3:18
    for fr=1:framerate
    imageE(3,j)=255;
    imageE(4,j)=255;
    if opt == 2
    fwrite(move, transpose(imageE));
    end
    num=num+1;
    %imshow(imageE);
    end
end
if opt == 3
    for fr=1:framerate
    fwrite(move,transpose(imageE));
    end
end


%horizontal line in the mid
for i=3:15
    for fr=1:framerate
    imageE(10,i)=255;
    imageE(11,i)=255;
    if opt == 2
    fwrite(move, transpose(imageE));
    end
    num=num+1;
    %imshow(imageE);
    end
end
if opt == 3
    for fr=1:framerate
    fwrite(move,transpose(imageE));
    end
end

%horizontal line on the bot
for i=3:18
    for fr=1:framerate
    imageE(17,i)=255;
    imageE(18,i)=255;
    if opt == 2
    fwrite(move, transpose(imageE));
    end
    num=num+1;
    %imshow(imageE);
    end
end
if opt == 3
    for fr=1:framerate
    fwrite(move,transpose(imageE));
    end
end

if opt == 1
    fwrite(move,transpose(imageE));
end
imshow(imageE);
