clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;


NewELoc=fopen(['E-PxBPx-FR' num2str(framerate) '.txt'],'w');
NewELoc2=fopen(['E-Static.txt'], 'w');

open allmatrices.mat;
Ematrix=ans.Ematrix;
Enew=zeros(20,20);

Enew(5:7,5:7)=Ematrix(5:7,5:7);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)

Enew(8:10,5:7)=Ematrix(8:10,5:7);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(11:13,5:7)=Ematrix(11:13,5:7);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(14:16,5:7)=Ematrix(14:16,5:7);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(17:19,5:7)=Ematrix(17:19,5:7);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(5:7,7:9)=Ematrix(5:7,7:9);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(5:7,10:12)=Ematrix(5:7,10:12);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(5:7,13:15)=Ematrix(5:7,13:15);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)

Enew(11:13,7:9)=Ematrix(11:13,7:9);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(11:13,10:12)=Ematrix(11:13,10:12);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(11:13,13:15)=Ematrix(11:13,13:15);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)



Enew(17:19,7:9)=Ematrix(17:19,7:9);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(17:19,10:12)=Ematrix(17:19,10:12);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)


Enew(17:19,13:15)=Ematrix(17:19,13:15);
for fr=1:framerate
fwrite(NewELoc, transpose(Enew));
end
imshow(Enew)

fwrite(NewELoc2, transpose(Enew));