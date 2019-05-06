
NewJLoc2=fopen(['J-Static.txt'], 'w');
NewJLoc=fopen(['J-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Jmatrix=ans.Jmatrix;

gradualmatrix=double(Jmatrix);

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

Jmatrix=uint8(gradualmatrix);

Jnew=zeros(20,20);

Jnew(5:7,8:10)=Jmatrix(5:7,8:10);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)


Jnew(5:7,11:12)=Jmatrix(5:7,11:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(8:10,11:12)=Jmatrix(8:10,11:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(11:13,11:12)=Jmatrix(11:13,11:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(14:16,10:12)=Jmatrix(14:16,10:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(17:19,10:12)=Jmatrix(17:19,10:12);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

Jnew(17:19,6:9)=Jmatrix(17:19,6:9);
for fr=1:framerate
fwrite(NewJLoc, transpose(Jnew));
end
imshow(Jnew)

fwrite(NewJLoc2, transpose(Jnew));