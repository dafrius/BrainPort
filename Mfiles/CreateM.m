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
movm=fopen([pwd filesep 'Static' filesep 'M-Static.txt'],'w');
elseif opt == 2
movm=fopen([pwd filesep 'PixByPix' filesep 'M-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movm=fopen([pwd filesep 'PieceByPiece' filesep 'M-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageM=zeros(20,20); 

for i=3:18
    for fr=1:framerate
    imageM(i,3)=255;
    imageM(i,4)=255;
    if opt == 2
    fwrite(movm, transpose(imageM));
    end
    %imshow(imageM);
    end
end
num=1;
x=3;

if opt == 3
    for fr=1:framerate
        fwrite(movm, transpose(imageM));
    end
end


for j=3:10
    for fr=1:framerate
        imageM(x,j)=255;
        imageM(x+1,j+1)=255;
        imageM(x+1,j)=255;
        if opt == 2
        fwrite(movm, transpose(imageM));
        end
        %imshow(imageM);
    end
        x=x+2;
        if x>18
            break
        end
end

if opt == 3
    for fr=1:framerate
        fwrite(movm, transpose(imageM));
    end
end

for j=11:18
    for fr=1:framerate
        imageM(i,j)=255;
        imageM(i-1,j)=255;
        if i>5
        imageM(i-2,j)=255;
        end
        if opt == 2
        fwrite(movm, transpose(imageM));
        end
        %imshow(imageM);
    end
        i=i-2;
end

if opt == 3
    for fr=1:framerate
        fwrite(movm, transpose(imageM));
    end
end

for i=3:18
    for fr=1:framerate
    imageM(i,17)=255;
    imageM(i,18)=255;
        if opt == 2
        fwrite(movm, transpose(imageM));
        end
        %imshow(imageM);
    end
end

if opt == 3
    for fr=1:framerate
        fwrite(movm, transpose(imageM));
    end
end

if opt == 1
        fwrite(movm, transpose(imageM));
end