clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;


NewCLoc=fopen(['C-PxBPx-FR' num2str(framerate) '.txt'],'w');
NewCLoc2=fopen(['C-Static.txt'], 'w');


open allmatrices.mat;
Cmatrix=ans.Cmatrix;
Cnew=zeros(20,20);

Cnew(6:8,14:16)=Cmatrix(6:8,14:16);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)

Cnew(5:7,13:15)=Cmatrix(5:7,13:15);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)

Cnew(5:7,11:13)=Cmatrix(5:7,11:13);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)


Cnew(5:7,8:10)=Cmatrix(5:7,8:10);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)


Cnew(6:8,6:8)=Cmatrix(6:8,6:8);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)


Cnew(8:10,5:7)=Cmatrix(8:10,5:7);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)


Cnew(11:13,5:7)=Cmatrix(11:13,5:7);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)


Cnew(14:16,5:7)=Cmatrix(14:16,5:7);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)


Cnew(16:18,6:8)=Cmatrix(16:18,6:8);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)


Cnew(17:19,8:10)=Cmatrix(17:19,8:10);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)


Cnew(17:19,11:13)=Cmatrix(17:19,11:13);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)


Cnew(16:19,14:16)=Cmatrix(16:19,14:16);
for fr=1:framerate
fwrite(NewCLoc, transpose(Cnew));
end
imshow(Cnew)

NewALoc2=fopen(['A-Static.txt'], 'w');

fwrite(NewCLoc2, transpose(Cnew));