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
movi=fopen([pwd filesep 'Static' filesep 'I-Static.txt'],'w');
elseif opt == 2
movi=fopen([pwd filesep 'PixByPix' filesep 'I-PixByPix-FR' num2str(framerate) '.txt'],'w');
elseif opt == 3
movi=fopen([pwd filesep 'PieceByPiece' filesep 'I-PieceByPiece-FR' num2str(framerate) '.txt'],'w');
end

imageI=zeros(20,20); %image for stimulation of back of tongue


num=1;
for i=3:18
    for fr=1:framerate
    imageI(i,10)=255;
    imageI(i,11)=255;
    if opt == 2
    fwrite(movi, transpose(imageI));
    end
    end
end

if opt == 1 || 3
    fwrite(movi, transpose(imageI));
end
