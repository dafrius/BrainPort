
NewZLoc2=fopen(['Z-Static.txt'], 'w');
NewZLoc=fopen(['Z-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Zmatrix=ans.Zmatrix;

gradualmatrix=double(Zmatrix);

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

Zmatrix=uint8(gradualmatrix);

Znew=zeros(20,20);

Znew(5:7,5:7)=Zmatrix(5:7,5:7);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(5:7,8:10)=Zmatrix(5:7,8:10);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(5:7,11:13)=Zmatrix(5:7,11:13);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(5:7,14:16)=Zmatrix(5:7,14:16);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(8:10,13:16)=Zmatrix(8:10,13:16);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(8:12,11:13)=Zmatrix(8:12,11:13);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(11:13,8:11)=Zmatrix(11:13,8:11);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(14:16,8:10)=Zmatrix(14:16,8:10);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(14:16,5:7)=Zmatrix(14:16,5:7);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(17:19,5:7)=Zmatrix(17:19,5:7);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)


Znew(17:19,8:10)=Zmatrix(17:19,8:10);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

Znew(17:19,11:13)=Zmatrix(17:19,11:13);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)


Znew(17:19,14:16)=Zmatrix(17:19,14:16);
for fr=1:framerate
fwrite(NewZLoc, transpose(Znew));
end
imshow(Znew)

fwrite(NewZLoc2, transpose(Znew));