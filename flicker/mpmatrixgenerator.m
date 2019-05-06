clear

    answr2=inputdlg({'Framerate:'},'Enter Framerate ',[1 17],{'5'});
    fra=str2double(answr2{1});
    vhfr=fra;


New0Loc=fopen(['VertHoriFR' num2str(vhfr) '-gapFR' num2str(gapfr) '.txt'],'w');

for i=1:5
    mpmatrix=zeros(20,20);

    mpmatrix(3:18,10:11)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(mpmatrix));
    frcount=frcount+1;
    end
    imshow(mpmatrix)

    mpmatrix=zeros(20,20);
    for fr=1:vhfr
    fwrite(New0Loc, transpose(mpmatrix));
    frcount=frcount+1;
    end
    imshow(mpmatrix)

    mpmatrix(10:11,3:18)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(mpmatrix));
    frcount=frcount+1;
    imshow(mpmatrix)
    end
    
end
