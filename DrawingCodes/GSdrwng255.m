
NewSLoc2=fopen(['S-Static.txt'], 'w');
NewSLoc=fopen(['S-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Smatrix=ans.Smatrix;

gradualmatrix=double(Smatrix);

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

Smatrix=uint8(gradualmatrix);

Snew=zeros(20,20);

Snew(5:7,13:15)=Smatrix(5:7,13:15);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)

Snew(5:7,10:12)=Smatrix(5:7,10:12);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)


Snew(5:7,7:9)=Smatrix(5:7,7:9);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)


Snew(5:7,5:7)=Smatrix(5:7,5:7);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)


Snew(8:10,5:7)=Smatrix(8:10,5:7);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)


Snew(10:13,5:8)=Smatrix(10:13,5:8);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)


Snew(11:13,9:11)=Smatrix(11:13,9:11);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)


Snew(11:13,12:15)=Smatrix(11:13,12:15);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)


Snew(13:15,13:16)=Smatrix(13:15,13:16);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)


Snew(16:19,13:16)=Smatrix(16:19,13:16);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)


Snew(17:19,10:12)=Smatrix(17:19,10:12);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)

Snew(17:19,7:9)=Smatrix(17:19,7:9);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)

Snew(16:19,5:6)=Smatrix(16:19,5:6);
for fr=1:framerate
fwrite(NewSLoc, transpose(Snew));
end
imshow(Snew)

fwrite(NewSLoc2, transpose(Snew));