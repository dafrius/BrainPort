
NewVLoc2=fopen(['V-Static.txt'], 'w');
NewVLoc=fopen(['V-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Vmatrix=ans.Vmatrix;

gradualmatrix=double(Vmatrix);

for i=1:15
gradualmatrix(i+4,:)=gradualmatrix(i+4,:)/100*(backsens-((backsens-frontsens)/14)*(i-1));
end

Vmatrix=uint8(gradualmatrix);

Vnew=zeros(20,20);

Vnew(5:8,3:6)=Vmatrix(5:8,3:6);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)

Vnew(9:11,5:7)=Vmatrix(9:11,5:7);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)

Vnew(11:13,6:8)=Vmatrix(11:13,6:8);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)


Vnew(14:16,7:9)=Vmatrix(14:16,7:9);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)


Vnew(17:19,8:10)=Vmatrix(17:19,8:10);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)


Vnew(17:19,10:12)=Vmatrix(17:19,10:12);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)

Vnew(14:16,11:13)=Vmatrix(14:16,11:13);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)

Vnew(11:13,12:14)=Vmatrix(11:13,12:14);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)


Vnew(8:11,13:16)=Vmatrix(8:11,13:16);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)

Vnew(5:7,14:17)=Vmatrix(5:7,14:17);
for fr=1:framerate
fwrite(NewVLoc, transpose(Vnew));
end
imshow(Vnew)

fwrite(NewVLoc2, transpose(Vnew));