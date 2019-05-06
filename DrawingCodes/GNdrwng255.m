
NewNLoc2=fopen(['N-Static.txt'], 'w');
NewNLoc=fopen(['N-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Nmatrix=ans.Nmatrix;

gradualmatrix=double(Nmatrix);

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

Nmatrix=uint8(gradualmatrix);

Nnew=zeros(20,20);

Nnew(5:7,5:6)=Nmatrix(5:7,5:6);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)


Nnew(8:10,5:6)=Nmatrix(8:10,5:6);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)


Nnew(11:13,5:7)=Nmatrix(11:13,5:7);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

Nnew(14:16,5:7)=Nmatrix(14:16,5:7);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)


Nnew(17:19,5:7)=Nmatrix(17:19,5:7);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

Nnew(5:7,7:9)=Nmatrix(5:7,7:9);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

Nnew(8:10,7:10)=Nmatrix(8:10,7:10);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

Nnew(11:13,9:12)=Nmatrix(11:13,9:12);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

Nnew(14:16,10:13)=Nmatrix(14:16,10:13);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)


Nnew(17:19,11:13)=Nmatrix(17:19,11:13);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)


Nnew(17:19,14:15)=Nmatrix(17:19,14:15);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)


Nnew(14:16,14:15)=Nmatrix(14:16,14:15);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

Nnew(11:13,14:15)=Nmatrix(11:13,14:15);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

Nnew(8:10,14:15)=Nmatrix(8:10,14:15);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

Nnew(5:7,14:15)=Nmatrix(5:7,14:15);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

Nnew(11:13,14:15)=Nmatrix(11:13,14:15);
for fr=1:framerate
fwrite(NewNLoc, transpose(Nnew));
end
imshow(Nnew)

fwrite(NewNLoc2, transpose(Nnew));