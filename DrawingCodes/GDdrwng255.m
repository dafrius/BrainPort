
NewDLoc=fopen(['D-PxBPx-FR' num2str(framerate) '.txt'],'w');
NewDLoc2=fopen(['D-Static.txt'], 'w');

open allmatrices.mat;
Dmatrix=ans.Dmatrix;

gradualmatrix=double(Dmatrix);

for i=1:20
    for j=1:20
        if gradualmatrix(i,j)~= 0
            gradualmatrix(i,j)=255;
        end
    end
end

for i=1:15
gradualmatrix(i+4,:)=gradualmatrix(i+4,:)/100*(backsens-((backsens-frontsens)/14)*(i-1));
end

Dmatrix=uint8(gradualmatrix);

Dnew=zeros(20,20);

Dnew(5:7,4:6)=Dmatrix(5:7,4:6);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(8:10,4:6)=Dmatrix(8:10,4:6);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(11:13,4:6)=Dmatrix(11:13,4:6);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(14:16,4:6)=Dmatrix(14:16,4:6);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(17:19,4:6)=Dmatrix(17:19,4:6);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(5:7,7:9)=Dmatrix(5:7,7:9);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(5:7,10:12)=Dmatrix(5:7,10:12);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(6:8,13:15)=Dmatrix(6:8,13:15);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(8:10,14:16)=Dmatrix(8:10,14:16);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(11:13,14:16)=Dmatrix(11:13,14:16);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(14:16,14:16)=Dmatrix(14:16,14:16);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(16:19,13:15)=Dmatrix(16:19,13:15);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(17:19,10:12)=Dmatrix(17:19,10:12);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)


Dnew(17:19,7:9)=Dmatrix(17:19,7:9);
for fr=1:framerate
fwrite(NewDLoc, transpose(Dnew));
end
imshow(Dnew)

fwrite(NewDLoc2, transpose(Dnew));