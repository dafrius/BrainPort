clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewJLoc2=fopen(['J-Static.txt'], 'w');
NewJLoc=fopen(['J-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Jmatrix=ans.Jmatrix;
Jnew=zeros(20,20);

Jnew(5:7,8:10)=Jmatrix(5:7,8:10);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)


Jnew(5:7,11:12)=Jmatrix(5:7,11:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(8:10,11:12)=Jmatrix(8:10,11:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(11:13,11:12)=Jmatrix(11:13,11:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(14:16,10:12)=Jmatrix(14:16,10:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(17:19,10:12)=Jmatrix(17:19,10:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(17:19,6:9)=Jmatrix(17:19,6:9);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

fwrite(NewJLoc2, transpose(Jnew));