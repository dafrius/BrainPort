clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewHLoc2=fopen(['H-Static.txt'], 'w');
NewHLoc=fopen(['H-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Hmatrix=ans.Hmatrix;
Hnew=zeros(20,20);

Hnew(5:7,4:6)=Hmatrix(5:7,4:6);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(8:10,4:6)=Hmatrix(8:10,4:6);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(11:13,4:6)=Hmatrix(11:13,4:6);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(14:16,4:6)=Hmatrix(14:16,4:6);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(17:19,4:6)=Hmatrix(17:19,4:6);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(11:13,6:7)=Hmatrix(11:13,6:7);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(11:13,8:9)=Hmatrix(11:13,8:9);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)


Hnew(11:13,10:11)=Hmatrix(11:13,10:11);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)


Hnew(11:13,12:13)=Hmatrix(11:13,12:13);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(5:7,14:16)=Hmatrix(5:7,14:16);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(8:10,14:16)=Hmatrix(8:10,14:16);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(11:13,14:16)=Hmatrix(11:13,14:16);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(14:16,14:16)=Hmatrix(14:16,14:16);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)

Hnew(17:19,14:16)=Hmatrix(17:19,14:16);
for fr=1:framerate
fwrite(NewHLoc, transpose(Hnew));
end
imshow(Hnew)
