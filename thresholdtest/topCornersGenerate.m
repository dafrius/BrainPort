clear all
clearvars

% for 
intlevel=255;

activeelectrode=20;
    y=21;
    for x=1:8    
        imgTopCorners=zeros(20,20);
        totallevel=intlevel*4;
        intlevel=totallevel/activeelectrode;
        
        output=fopen([pwd filesep num2str(x) '-' num2str(x+1) '.' num2str(21-x) '-' num2str(20-x) '.' num2str(intlevel) '-bar.txt' ],'w');
        % imgTopCorners(5,x:x+1)=intlevel;
        z=y-x;
        activeelectrode=activeelectrode-2;
        imgTopCorners(5,x:z)=intlevel;
        fwrite(output, transpose(imgTopCorners));
        imshow(imgTopCorners);
        fclose(output);
        intlevel=255;
    end
% end