clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewYLoc2=fopen(['Y-Static.txt'], 'w');
NewYLoc=fopen(['Y-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Ymatrix=ans.Ymatrix;
Ynew=zeros(20,20);

Ynew(5:7,5:8)=Ymatrix(5:7,5:8);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(8:10,6:9)=Ymatrix(8:10,6:9);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(10:13,8:10)=Ymatrix(10:13,8:10);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)


Ynew(5:7,13:16)=Ymatrix(5:7,13:16);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(8:10,12:15)=Ymatrix(8:10,12:15);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(10:13,11:13)=Ymatrix(10:13,11:13);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(14:16,10:11)=Ymatrix(14:16,10:11);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(17:19,10:11)=Ymatrix(17:19,10:11);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

