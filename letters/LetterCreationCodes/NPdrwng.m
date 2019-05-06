clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewPLoc2=fopen(['P-Static.txt'], 'w');
NewPLoc=fopen(['P-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Pmatrix=ans.Pmatrix;
Pnew=zeros(20,20);

Pnew(5:7,7:8)=Pmatrix(5:7,7:8);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)

Pnew(8:10,7:8)=Pmatrix(8:10,7:8);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)

Pnew(11:13,7:8)=Pmatrix(11:13,7:8);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)


Pnew(14:16,7:8)=Pmatrix(14:16,7:8);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)


Pnew(17:19,7:8)=Pmatrix(17:19,7:8);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)


Pnew(5:7,9:10)=Pmatrix(5:7,9:10);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)



Pnew(5:7,11:13)=Pmatrix(5:7,11:13);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)


Pnew(5:7,13:15)=Pmatrix(5:7,13:15);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)

Pnew(8:10,13:15)=Pmatrix(8:10,13:15);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)

Pnew(11:13,13:15)=Pmatrix(11:13,13:15);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)

Pnew(11:13,10:12)=Pmatrix(11:13,10:12);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)

Pnew(11:13,8:9)=Pmatrix(11:13,8:9);
for fr=1:framerate
fwrite(NewPLoc, transpose(Pnew));
end
imshow(Pnew)

fwrite(NewPLoc2, transpose(Pnew));