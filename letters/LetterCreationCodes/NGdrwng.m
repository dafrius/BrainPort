clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewGLoc2=fopen(['G-Static.txt'], 'w');
NewGLoc=fopen(['G-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Gmatrix=ans.Gmatrix;
Gnew=zeros(20,20);

Gnew(5:8,15:17)=Gmatrix(5:8,15:17);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

Gnew(5:7,12:14)=Gmatrix(5:7,12:14);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

Gnew(5:7,9:11)=Gmatrix(5:7,9:11);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

Gnew(5:8,6:8)=Gmatrix(5:8,6:8);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

Gnew(6:8,4:6)=Gmatrix(6:8,4:6);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

Gnew(9:11,4:6)=Gmatrix(9:11,4:6);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

Gnew(12:14,4:6)=Gmatrix(12:14,4:6);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

Gnew(15:17,4:6)=Gmatrix(15:17,4:6);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

Gnew(16:18,6:8)=Gmatrix(16:18,6:8);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)


Gnew(17:19,8:10)=Gmatrix(17:19,8:10);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)


Gnew(17:19,11:13)=Gmatrix(17:19,11:13);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)


Gnew(17:19,14:16)=Gmatrix(17:19,14:16);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)


Gnew(16:18,15:17)=Gmatrix(16:18,15:17);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)


Gnew(11:15,15:17)=Gmatrix(11:15,15:17);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

Gnew(11:15,12:14)=Gmatrix(11:15,12:14);
for fr=1:framerate
fwrite(NewGLoc, transpose(Gnew));
end
imshow(Gnew)

fwrite(NewGLoc2, transpose(Gnew));