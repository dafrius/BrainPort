clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewOLoc2=fopen(['O-Static.txt'], 'w');
NewOLoc=fopen(['O-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Omatrix=ans.Omatrix;
Onew=zeros(20,20);

Onew(5:7,8:10)=Omatrix(5:7,8:10);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)

Onew(5:7,5:7)=Omatrix(5:7,5:7);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)

Onew(8:10,4:7)=Omatrix(8:10,4:7);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)


Onew(11:13,4:6)=Omatrix(11:13,4:6);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)


Onew(14:16,4:7)=Omatrix(14:16,4:7);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)


Onew(17:19,5:7)=Omatrix(17:19,5:7);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)


Onew(17:19,8:10)=Omatrix(17:19,8:10);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)


Onew(17:19,11:13)=Omatrix(17:19,11:13);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)


Onew(17:19,14:16)=Omatrix(17:19,14:16);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)


Onew(14:16,14:17)=Omatrix(14:16,14:17);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)

Onew(11:13,14:17)=Omatrix(11:13,14:17);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)

Onew(8:10,14:17)=Omatrix(8:10,14:17);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)

Onew(5:7,14:16)=Omatrix(5:7,14:16);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)

Onew(5:7,11:13)=Omatrix(5:7,11:13);
for fr=1:framerate
fwrite(NewOLoc, transpose(Onew));
end
imshow(Onew)

fwrite(NewOLoc2, transpose(Onew));