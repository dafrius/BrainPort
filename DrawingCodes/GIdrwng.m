


NewILoc2=fopen(['I-Static.txt'], 'w');
NewILoc=fopen(['I-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Imatrix=ans.Imatrix;

gradualmatrix=double(Imatrix);

for i=1:15
gradualmatrix(i+4,:)=gradualmatrix(i+4,:)/100*(backsens-((backsens-frontsens)/14)*(i-1));
end

Imatrix=uint8(gradualmatrix);

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

fwrite(NewILoc2, transpose(Inew));