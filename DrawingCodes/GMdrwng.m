

NewMLoc2=fopen(['M-Static.txt'], 'w');
NewMLoc=fopen(['M-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Mmatrix=ans.Mmatrix;

gradualmatrix=double(Mmatrix);

for i=1:15
gradualmatrix(i+4,:)=gradualmatrix(i+4,:)/100*(backsens-((backsens-frontsens)/14)*(i-1));
end

Mmatrix=uint8(gradualmatrix);

Mnew=zeros(20,20);

Mnew(5:7,4:5)=Mmatrix(5:7,4:5);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(8:10,4:5)=Mmatrix(8:10,4:5);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(11:13,4:5)=Mmatrix(11:13,4:5);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(14:16,4:5)=Mmatrix(14:16,4:5);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(17:19,4:5)=Mmatrix(17:19,4:5);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(5:7,6:8)=Mmatrix(5:7,6:8);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(8:10,6:9)=Mmatrix(8:10,6:9);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)


Mnew(11:13,7:9)=Mmatrix(11:13,7:9);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)


Mnew(13:15,9:12)=Mmatrix(13:15,9:12);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)


Mnew(10:12,10:13)=Mmatrix(10:12,10:13);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)


Mnew(7:9,12:14)=Mmatrix(7:9,12:14);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)


Mnew(5:7,13:16)=Mmatrix(5:7,13:16);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(8:10,13:16)=Mmatrix(8:10,13:16);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(11:13,13:16)=Mmatrix(11:13,13:16);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(14:16,13:16)=Mmatrix(14:16,13:16);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

Mnew(17:19,13:16)=Mmatrix(17:19,13:16);
for fr=1:framerate
fwrite(NewMLoc, transpose(Mnew));
end
imshow(Mnew)

fwrite(NewMLoc2, transpose(Mnew));