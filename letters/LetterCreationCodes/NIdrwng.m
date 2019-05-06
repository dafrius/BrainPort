clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewILoc2=fopen(['I-Static.txt'], 'w');
NewILoc=fopen(['I-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Imatrix=ans.Imatrix;
Inew=zeros(20,20);

Inew(5:7,8:10)=Imatrix(5:7,8:10);
for fr=1:framerate
fwrite(NewILoc, transpose(Inew));
end
imshow(Inew)

Inew(5:7,11:13)=Imatrix(5:7,11:13);
for fr=1:framerate
fwrite(NewILoc, transpose(Inew));
end
imshow(Inew)

Inew(8:10,10:11)=Imatrix(8:10,10:11);
for fr=1:framerate
fwrite(NewILoc, transpose(Inew));
end
imshow(Inew)


Inew(11:13,10:11)=Imatrix(11:13,10:11);
for fr=1:framerate
fwrite(NewILoc, transpose(Inew));
end
imshow(Inew)

Inew(14:16,10:11)=Imatrix(14:16,10:11);
for fr=1:framerate
fwrite(NewILoc, transpose(Inew));
end
imshow(Inew)

Inew(17:19,10:11)=Imatrix(17:19,10:11);
for fr=1:framerate
fwrite(NewILoc, transpose(Inew));
end
imshow(Inew)

Inew(18:19,8:10)=Imatrix(18:19,8:10);
for fr=1:framerate
fwrite(NewILoc, transpose(Inew));
end
imshow(Inew)

Inew(18:19,11:13)=Imatrix(18:19,11:13);
for fr=1:framerate
fwrite(NewILoc, transpose(Inew));
end
imshow(Inew)