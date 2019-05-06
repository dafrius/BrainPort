BIALoc=fopen(['backintensityadjustment.txt'], 'w');
BIAmatrix=zeros(20,20);
BIAmatrix(4:5,2:19)=255;
fwrite(BIALoc, transpose(BIAmatrix));

FIALoc=fopen(['frontintensityadjustment.txt'], 'w');
FIAmatrix=zeros(20,20);
FIAmatrix(19:20,2:19)=255;
fwrite(FIALoc, transpose(FIAmatrix));
