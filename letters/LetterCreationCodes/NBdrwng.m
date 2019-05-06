clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;


NewBLoc=fopen(['B-PxBPx-FR' num2str(framerate) '.txt'],'w');
NewBLoc2=fopen(['B-Static.txt'], 'w');

open allmatrices.mat;
Bmatrix=ans.Bmatrix;
Bnew=zeros(20,20);

Bnew(5:7,5:7)=Bmatrix(5:7,5:7);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(8:10,5:7)=Bmatrix(8:10,5:7);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(11:13,5:7)=Bmatrix(11:13,5:7);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(14:16,5:7)=Bmatrix(14:16,5:7);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(17:19,5:7)=Bmatrix(17:19,5:7);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(5:7,8:10)=Bmatrix(5:7,8:10);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(5:7,11:14)=Bmatrix(5:7,11:14);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(6:8,13:15)=Bmatrix(6:8,13:15);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(9:11,13:15)=Bmatrix(9:11,13:15);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(10:12,11:13)=Bmatrix(10:12,11:13);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(10:12,8:10)=Bmatrix(10:12,8:10);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(10:12,11:13)=Bmatrix(10:12,11:13);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(12:14,12:14)=Bmatrix(12:14,12:14);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(12:14,15:16)=Bmatrix(12:14,15:16);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(15:18,14:16)=Bmatrix(15:18,14:16);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(17:19,12:14)=Bmatrix(17:19,12:14);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(17:19,10:11)=Bmatrix(17:19,10:11);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

Bnew(17:19,8:9)=Bmatrix(17:19,8:9);
for fr=1:framerate
fwrite(NewBLoc, transpose(Bnew));
end
imshow(Bnew)

fwrite(NewBLoc2, transpose(Bnew));