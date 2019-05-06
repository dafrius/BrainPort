

NewQLoc2=fopen(['Q-Static.txt'], 'w');
NewQLoc=fopen(['Q-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Qmatrix=ans.Qmatrix;

gradualmatrix=double(Qmatrix);

for i=1:15
gradualmatrix(i+4,:)=gradualmatrix(i+4,:)/100*(backsens-((backsens-frontsens)/14)*(i-1));
end

Qmatrix=uint8(gradualmatrix);

Qnew=zeros(20,20);

Qnew(4:6,8:10)=Qmatrix(4:6,8:10);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(4:7,4:7)=Qmatrix(4:7,4:7);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)


Qnew(8:10,4:6)=Qmatrix(8:10,4:6);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)


Qnew(11:13,4:6)=Qmatrix(11:13,4:6);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)


Qnew(14:16,4:6)=Qmatrix(14:16,4:6);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(15:18,5:7)=Qmatrix(15:18,5:7);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)


Qnew(16:18,8:10)=Qmatrix(16:18,8:10);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)


Qnew(16:18,11:13)=Qmatrix(16:18,11:13);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(15:17,14:17)=Qmatrix(15:17,14:17);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(12:14,15:17)=Qmatrix(12:14,15:17);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(9:11,15:17)=Qmatrix(9:11,15:17);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(6:8,15:17)=Qmatrix(6:8,15:17);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(4:7,13:15)=Qmatrix(4:7,13:15);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(4:6,11:13)=Qmatrix(4:6,11:13);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(14:16,11:13)=Qmatrix(14:16,11:13);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

Qnew(18:19,14:17)=Qmatrix(18:19,14:17);
for fr=1:framerate
fwrite(NewQLoc, transpose(Qnew));
end
imshow(Qnew)

fwrite(NewQLoc2, transpose(Qnew));
