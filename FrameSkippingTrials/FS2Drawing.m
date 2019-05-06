clear

    answr2=inputdlg({'Framerate:'},'Enter Framerate ',[1 17],{'5'});
    fra=str2double(answr2{1});
    vhfr=fra;

    answr3=inputdlg({'Repetition:'},'Enter Repetition ',[1 17],{'5'});
    rep=str2double(answr3{1});
    
    
New0Loc=fopen(['FSSquareDrawing' num2str(vhfr) '-' num2str(rep) '.txt'],'w');
frcount=0;
for i=1:rep
    fsmatrix=zeros(20,20);
    fsmatrix(8,8)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)

    %fsmatrix=zeros(20,20);
    fsmatrix(8,9)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)

    %fsmatrix=zeros(20,20);
    fsmatrix(8,10)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(8,11)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)    
    
    %fsmatrix=zeros(20,20);
    fsmatrix(8,12)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(9,12)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(10,12)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(11,12)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(12,12)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(12,11)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(12,10)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(12,9)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(12,8)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(11,8)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(10,8)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
    
    %fsmatrix=zeros(20,20);
    fsmatrix(9,8)=255;
    for fr=1:vhfr
    fwrite(New0Loc, transpose(fsmatrix));
    frcount=frcount+1;
    end
    imshow(fsmatrix)
end
