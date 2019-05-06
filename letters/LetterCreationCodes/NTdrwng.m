clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewTLoc2=fopen(['T-Static.txt'], 'w');
NewTLoc=fopen(['T-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Tmatrix=ans.Tmatrix;
Tnew=zeros(20,20);

Tnew(5:7,5:7)=Tmatrix(5:7,5:7);
for fr=1:framerate
fwrite(NewTLoc, transpose(Tnew));
end
imshow(Tnew)


Tnew(5:6,8:10)=Tmatrix(5:6,8:10);
for fr=1:framerate
fwrite(NewTLoc, transpose(Tnew));
end
imshow(Tnew)


Tnew(5:6,11:13)=Tmatrix(5:6,11:13);
for fr=1:framerate
fwrite(NewTLoc, transpose(Tnew));
end
imshow(Tnew)


Tnew(5:6,14:16)=Tmatrix(5:6,14:16);
for fr=1:framerate
fwrite(NewTLoc, transpose(Tnew));
end
imshow(Tnew)


Tnew(7:9,10:11)=Tmatrix(7:9,10:11);
for fr=1:framerate
fwrite(NewTLoc, transpose(Tnew));
end
imshow(Tnew)

Tnew(10:12,10:11)=Tmatrix(10:12,10:11);
for fr=1:framerate
fwrite(NewTLoc, transpose(Tnew));
end
imshow(Tnew)

Tnew(13:15,10:11)=Tmatrix(13:15,10:11);
for fr=1:framerate
fwrite(NewTLoc, transpose(Tnew));
end
imshow(Tnew)

Tnew(16:19,10:11)=Tmatrix(16:19,10:11);
for fr=1:framerate
fwrite(NewTLoc, transpose(Tnew));
end
imshow(Tnew)

fwrite(NewTLoc2, transpose(Tnew));