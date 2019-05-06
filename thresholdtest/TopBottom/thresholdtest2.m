clear all
clearvars

framerate=1;

for intlevel=5:5:255
    imgHTLR=zeros(20,20);
        movingHTLR=fopen([pwd filesep 'Bot80-Top' num2str(intlevel) '.txt' ],'w');
    
    for x=1:20
        for fr=1:framerate
            imgHTLR(5:6,x)=intlevel;
            imgHTLR(18:19,x)=80;
        end
    end
    
    
       fwrite(movingHTLR, transpose(imgHTLR));
        imshow(imgHTLR);
    fclose(movingHTLR);
end