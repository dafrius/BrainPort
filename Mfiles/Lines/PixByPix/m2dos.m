commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1);


filename='VMidTB-S-PixByPix-FR4.txt';

commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp' filename '>client.in'];
system(commm2);
pause;



%nodsktp=['matlab -nodesktop'];
%system(nodsktp);
