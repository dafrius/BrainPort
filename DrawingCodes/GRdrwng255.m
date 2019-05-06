
NewRLoc2=fopen(['R-Static.txt'], 'w');
NewRLoc=fopen(['R-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Rmatrix=ans.Rmatrix;

gradualmatrix=double(Rmatrix);

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

Rmatrix=uint8(gradualmatrix);

Rnew=zeros(20,20);

Rnew(5:7,6:7)=Rmatrix(5:7,6:7);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(8:10,6:7)=Rmatrix(8:10,6:7);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(11:13,6:7)=Rmatrix(11:13,6:7);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)


Rnew(14:16,6:7)=Rmatrix(14:16,6:7);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)


Rnew(17:19,6:7)=Rmatrix(17:19,6:7);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(5:7,8:10)=Rmatrix(5:7,8:10);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(5:7,11:13)=Rmatrix(5:7,11:13);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(5:7,14:16)=Rmatrix(5:7,14:16);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(8:10,13:15)=Rmatrix(8:10,13:15);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(11:13,13:15)=Rmatrix(11:13,13:15);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(11:13,10:12)=Rmatrix(11:13,10:12);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(11:13,8:9)=Rmatrix(11:13,8:9);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(14:16,10:13)=Rmatrix(14:16,10:13);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(15:17,13:16)=Rmatrix(15:17,13:16);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

Rnew(18:19,14:17)=Rmatrix(18:19,14:17);
for fr=1:framerate
fwrite(NewRLoc, transpose(Rnew));
end
imshow(Rnew)

fwrite(NewRLoc2, transpose(Rnew));
