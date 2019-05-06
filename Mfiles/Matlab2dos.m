answr1=inputdlg({'Stimtype: 1=Static 2=PixByPix 3=PieceByPiece'},'Enter stimulus drawing type',[1,17] ,{'1'});
opt=str2double(answr1{1});


StcLetList=dir('*Static.txt');

PixLetList=dir('*e-FR*.txt');

PiecLetList=dir('*x-FR*.txt');


StcRow=randperm(length(StcLetList));
PixRow=randperm(length(PixLetList));
PiecRow=randperm(length(PiecLetList));

if opt == 1
    lngth=length(StcRow);
elseif opt == 2
    lngth=length(PixRow);
elseif opt == 3
    lngth=length(PiecRow);
end
commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1);
for i=1:lngth
    if opt == 1
        filename=StcLetList(StcRow(i)).name;
        filename=[filesep 'Letters' filesep 'Static' filesep filename];
    elseif opt == 2
        filename=PixLetList(PixRow(i)).name;
        filename=[filesep 'Letters' filesep 'PixByPix' filesep filename];
    elseif opt == 3
        filename=PiecLetList(PiecRow(i)).name;
        filename=[filesep 'Letters' filesep 'PieceByPiece' filesep filename];
    end
commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp' filename '>client.in'];
system(commm2);
pause;

end
