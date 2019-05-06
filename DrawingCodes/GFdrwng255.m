

NewFLoc2=fopen(['F-Static.txt'], 'w');
NewFLoc=fopen(['F-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Fmatrix=ans.Fmatrix;

gradualmatrix=double(Fmatrix);

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

Fmatrix=uint8(gradualmatrix);

Fnew=zeros(20,20);

Fnew(5:7,6:8)=Fmatrix(5:7,6:8);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)

Fnew(8:10,6:8)=Fmatrix(8:10,6:8);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)


Fnew(11:13,6:8)=Fmatrix(11:13,6:8);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)


Fnew(14:16,6:8)=Fmatrix(14:16,6:8);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)


Fnew(17:19,6:8)=Fmatrix(17:19,6:8);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)


Fnew(5:7,7:9)=Fmatrix(5:7,7:9);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)


Fnew(5:7,10:12)=Fmatrix(5:7,10:12);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)


Fnew(5:7,13:16)=Fmatrix(5:7,13:16);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)

Fnew(11:13,7:9)=Fmatrix(11:13,7:9);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)


Fnew(11:13,10:12)=Fmatrix(11:13,10:12);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)


Fnew(11:13,13:15)=Fmatrix(11:13,13:15);
for fr=1:framerate
fwrite(NewFLoc, transpose(Fnew));
end
imshow(Fnew)

fwrite(NewFLoc2, transpose(Fnew));