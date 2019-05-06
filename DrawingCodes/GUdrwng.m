

NewULoc2=fopen(['U-Static.txt'], 'w');
NewULoc=fopen(['U-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Umatrix=ans.Umatrix;

gradualmatrix=double(Umatrix);

for i=1:15
gradualmatrix(i+4,:)=gradualmatrix(i+4,:)/100*(backsens-((backsens-frontsens)/14)*(i-1));
end

Umatrix=uint8(gradualmatrix);

Unew=zeros(20,20);

Unew(5:7,5:7)=Umatrix(5:7,5:7);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(8:10,5:7)=Umatrix(8:10,5:7);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(11:13,5:7)=Umatrix(11:13,5:7);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(14:16,5:7)=Umatrix(14:16,5:7);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)


Unew(17:19,5:7)=Umatrix(17:19,5:7);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(17:19,8:10)=Umatrix(17:19,8:10);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(17:19,11:12)=Umatrix(17:19,11:12);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(17:19,13:15)=Umatrix(17:19,13:15);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(14:16,13:15)=Umatrix(14:16,13:15);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(11:13,13:15)=Umatrix(11:13,13:15);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(8:10,13:15)=Umatrix(8:10,13:15);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

Unew(5:7,13:15)=Umatrix(5:7,13:15);
for fr=1:framerate
fwrite(NewULoc, transpose(Unew));
end
imshow(Unew)

fwrite(NewULoc2, transpose(Unew));