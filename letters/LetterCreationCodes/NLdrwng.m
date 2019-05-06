clear
clearvars
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;

NewLLoc2=fopen(['L-Static.txt'], 'w');
NewLLoc=fopen(['L-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Lmatrix=ans.Lmatrix;
Lnew=zeros(20,20);

Lnew(5:7,7:8)=Lmatrix(5:7,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(8:10,7:8)=Lmatrix(8:10,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(11:13,7:8)=Lmatrix(11:13,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(14:16,7:8)=Lmatrix(14:16,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)


Lnew(17:19,7:8)=Lmatrix(17:19,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(17:19,9:10)=Lmatrix(17:19,9:10);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(17:19,11:12)=Lmatrix(17:19,11:12);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(17:19,13:15)=Lmatrix(17:19,13:15);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)
fwrite(NewLLoc2, transpose(Lnew));
