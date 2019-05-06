
NewXLoc2=fopen(['X-Static.txt'], 'w');
NewXLoc=fopen(['X-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Xmatrix=ans.Xmatrix;

gradualmatrix=double(Xmatrix);

for i=1:15
gradualmatrix(i+4,:)=gradualmatrix(i+4,:)/100*(backsens-((backsens-frontsens)/14)*(i-1));
end

Xmatrix=uint8(gradualmatrix);

Xnew=zeros(20,20);

Xnew(5:7,5:7)=Xmatrix(5:7,5:7);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(6:8,7:9)=Xmatrix(6:8,7:9);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(9:11,7:10)=Xmatrix(9:11,7:10);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(11:13,10:12)=Xmatrix(11:13,10:12);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(13:15,11:14)=Xmatrix(13:15,11:14);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(16:18,12:14)=Xmatrix(16:18,12:14);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(17:19,14:16)=Xmatrix(17:19,14:16);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(5:7,14:16)=Xmatrix(5:7,14:16);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(6:9,11:14)=Xmatrix(6:9,11:14);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(10:12,11:13)=Xmatrix(10:12,11:13);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(12:15,7:10)=Xmatrix(12:15,7:10);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(16:18,7:9)=Xmatrix(16:18,7:9);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

Xnew(17:19,5:7)=Xmatrix(17:19,5:7);
for fr=1:framerate
fwrite(NewXLoc, transpose(Xnew));
end
imshow(Xnew)

fwrite(NewXLoc2, transpose(Xnew));




