
NewLLoc2=fopen(['L-Static.txt'], 'w');
NewLLoc=fopen(['L-PxBPx-FR' num2str(framerate) '.txt'],'w');


open allmatrices.mat;
Lmatrix=ans.Lmatrix;

gradualmatrix=double(Lmatrix);

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

Lmatrix=uint8(gradualmatrix);

Lnew=zeros(20,20);

Lnew(5:7,7:8)=Lmatrix(5:7,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(8:10,7:8)=Lmatrix(8:10,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(11:13,7:8)=Lmatrix(11:13,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(14:16,7:8)=Lmatrix(14:16,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)


Lnew(17:19,7:8)=Lmatrix(17:19,7:8);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(17:19,9:10)=Lmatrix(17:19,9:10);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(17:19,11:12)=Lmatrix(17:19,11:12);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

Lnew(17:19,13:15)=Lmatrix(17:19,13:15);
for fr=1:framerate
fwrite(NewLLoc, transpose(Lnew));
end
imshow(Lnew)

fwrite(NewLLoc2, transpose(Lnew));
