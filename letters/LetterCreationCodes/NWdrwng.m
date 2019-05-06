clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewWLoc2=fopen(['W-Static.txt'], 'w');
NewWLoc=fopen(['W-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Wmatrix=ans.Wmatrix;
Wnew=zeros(20,20);

Wnew(5:7,2:4)=Wmatrix(5:7,2:4);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(8:10,2:5)=Wmatrix(8:10,2:5);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(11:13,3:6)=Wmatrix(11:13,3:6);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(14:16,4:6)=Wmatrix(14:16,4:6);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(17:19,5:8)=Wmatrix(17:19,5:8);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(14:16,7:9)=Wmatrix(14:16,7:9);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(11:13,7:10)=Wmatrix(11:13,7:10);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(8:10,8:10)=Wmatrix(8:10,8:10);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(5:7,9:12)=Wmatrix(5:7,9:12);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(8:10,11:13)=Wmatrix(8:10,11:13);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)



Wnew(11:13,11:14)=Wmatrix(11:13,11:14);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)



Wnew(14:16,11:14)=Wmatrix(14:16,11:14);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)

Wnew(17:19,13:16)=Wmatrix(17:19,13:16);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)


Wnew(14:16,15:17)=Wmatrix(14:16,15:17);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)

Wnew(11:13,15:18)=Wmatrix(11:13,15:18);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)

Wnew(8:10,16:19)=Wmatrix(8:10,16:19);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)

Wnew(5:7,17:19)=Wmatrix(5:7,17:19);
for fr=1:framerate
fwrite(NewWLoc, transpose(Wnew));
end
imshow(Wnew)

fwrite(NewWLoc2, transpose(Wnew));