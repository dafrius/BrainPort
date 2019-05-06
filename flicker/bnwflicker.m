clear

    answr2=inputdlg({'Framerate:'},'Enter Framerate for each image',[1 17],{'5'});
    barfr=answr2{1};
    
    Flickloc=fopen(['Flickering-' num2str(barfr) 'in16.txt'],'w');
    barfr=str2double(barfr);

    framecount=0;
while framecount<16
    for i=1:barfr
        flickmatrix=zeros(20,20);
        framecount=framecount+1;
        fwrite(Flickloc, transpose(flickmatrix));
        imshow(flickmatrix)
    end
    
    for i=1:barfr
        flickmatrix=zeros(20,20);
        flickmatrix(1:20,1:20)=255;
        framecount=framecount+1;
        fwrite(Flickloc, transpose(flickmatrix));
        imshow(flickmatrix)
    end
end

    