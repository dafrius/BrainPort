clear

    answr2=inputdlg({'Bar Framerate:'},'Enter Framerate for Bars',[1 17],{'5'});
    barfr=answr2{1};
    
    
    answr3=inputdlg({'Repetition:'},'Enter Number of Repetitions',[1 17],{'5'});
    rep=answr3{1};

New0Loc=fopen(['VertHoriFR' num2str(barfr) 'REP' num2str(rep) '32.txt'],'w');
    barfr=str2double(barfr);
    rep=str2double(rep);

    
    for i=1:rep
        mpmatrix=zeros(20,20);
        
        mpmatrix(3:18,10:11)=255;
        for fr=1:barfr
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
        end
        
        mpmatrix=zeros(20,20);
        for fr=1:barfr
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
        end
        
        mpmatrix=zeros(20,20);
        mpmatrix(10:11,3:18)=255;
        for fr=1:barfr
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
        end
        
        
        mpmatrix=zeros(20,20);
        for fr=1:barfr
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
        end
    end

        mpmatrix=zeros(20,20);
        mpmatrix(3:18,10:11)=255;
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
    
        mpmatrix=zeros(20,20);
        fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
            
        mpmatrix=zeros(20,20);
        mpmatrix(10:11,3:18)=255;
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)

        mpmatrix=zeros(20,20);
        fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
            
        mpmatrix=zeros(20,20);
        mpmatrix(3:18,10:11)=255;
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
            
        mpmatrix=zeros(20,20);
        fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
            
        mpmatrix=zeros(20,20);
        mpmatrix(10:11,3:18)=255;
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
            
        mpmatrix=zeros(20,20);
        fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
            
        mpmatrix=zeros(20,20);
        mpmatrix(3:18,10:11)=255;
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
            
        mpmatrix=zeros(20,20);
        fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
            
        mpmatrix=zeros(20,20);
        mpmatrix(10:11,3:18)=255;
            fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)
            
        mpmatrix=zeros(20,20);
        fwrite(New0Loc, transpose(mpmatrix));
            imshow(mpmatrix)