
NewYLoc2=fopen(['Y-Static.txt'], 'w');
NewYLoc=fopen(['Y-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Ymatrix=ans.Ymatrix;

gradualmatrix=double(Ymatrix);

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

Ymatrix=uint8(gradualmatrix);

Ynew=zeros(20,20);

Ynew(5:7,5:8)=Ymatrix(5:7,5:8);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(8:10,6:9)=Ymatrix(8:10,6:9);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(10:13,8:10)=Ymatrix(10:13,8:10);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)


Ynew(5:7,13:16)=Ymatrix(5:7,13:16);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(8:10,12:15)=Ymatrix(8:10,12:15);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(10:13,11:13)=Ymatrix(10:13,11:13);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(14:16,10:11)=Ymatrix(14:16,10:11);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

Ynew(17:19,10:11)=Ymatrix(17:19,10:11);
for fr=1:framerate
fwrite(NewYLoc, transpose(Ynew));
end
imshow(Ynew)

fwrite(NewYLoc2, transpose(Ynew));