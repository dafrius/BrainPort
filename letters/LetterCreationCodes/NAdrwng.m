clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;


NewALoc=fopen(['A-PxBPx-FR' num2str(framerate) '.txt'],'w');
NewALoc2=fopen(['A-Static.txt'], 'w');

open allmatrices.mat;
Amatrix=ans.Amatrix;
Anew=zeros(20,20);

Anew(17:19,4:6)=Amatrix(17:19,4:6);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(15:17,5:7)=Amatrix(15:17,5:7);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(12:14,6:8)=Amatrix(12:14,6:8);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(9:11,7:9)=Amatrix(9:11,7:9);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(5:8,8:10)=Amatrix(5:8,8:10);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(5:8,11:13)=Amatrix(5:8,11:13);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(9:11,12:14)=Amatrix(9:11,12:14);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(12:14,13:15)=Amatrix(12:14,13:15);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(15:17,14:16)=Amatrix(15:17,14:16);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(18:20,15:17)=Amatrix(18:20,15:17);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(14:15,8:9)=Amatrix(14:15,8:9);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(14:15,10:11)=Amatrix(14:15,10:11);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

Anew(14:15,12:13)=Amatrix(14:15,12:13);
for fr=1:framerate
fwrite(NewALoc, transpose(Anew));
end
imshow(Anew)

fwrite(NewALoc2, transpose(Anew));