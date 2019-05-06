clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewKLoc2=fopen(['K-Static.txt'], 'w');
NewKLoc=fopen(['K-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Kmatrix=ans.Kmatrix;
Knew=zeros(20,20);

Knew(5:7,5:7)=Kmatrix(5:7,5:7);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)

Knew(8:10,5:7)=Kmatrix(8:10,5:7);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)


Knew(11:13,5:7)=Kmatrix(11:13,5:7);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)


Knew(14:16,5:7)=Kmatrix(14:16,5:7);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)

Knew(17:19,5:7)=Kmatrix(17:19,5:7);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)


Knew(5:7,15:17)=Kmatrix(5:7,15:17);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)

Knew(5:7,12:14)=Kmatrix(5:7,12:14);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)

Knew(8:10,12:14)=Kmatrix(8:10,12:14);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)

Knew(8:10,9:11)=Kmatrix(8:10,9:11);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)

Knew(11:12,8:11)=Kmatrix(11:12,8:11);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)

Knew(13:14,8:11)=Kmatrix(13:14,8:11);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)


Knew(13:15,11:13)=Kmatrix(13:15,11:13);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)


Knew(15:17,12:14)=Kmatrix(15:17,12:14);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)


Knew(17:19,14:17)=Kmatrix(17:19,14:17);
for fr=1:framerate
fwrite(NewKLoc, transpose(Knew));
end
imshow(Knew)

fwrite(NewKLoc2, transpose(Knew));