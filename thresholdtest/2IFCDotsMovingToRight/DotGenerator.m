clear all
clearvars

intlevel=255;

    for x=10:20
        output=fopen([pwd filesep '10-' num2str(x) '.' num2str(intlevel) 'dot.txt' ],'w');
        imgDots=zeros(20,20);
        for i=1:29
            imgDots(5,10)=255;
            fwrite(output, transpose(imgDots));
        end
        imgDots=zeros(20,20);
        for i=1:58
            fwrite(output, transpose(imgDots));
        end
        
        for i=1:29
        imgDots(5,x)=intlevel;
        fwrite(output, transpose(imgDots));
        end
        imgDots=zeros(20,20);
        for i=1:5
            fwrite(output, transpose(imgDots));
        end
        
            
        
        fclose(output);
        intlevel=255;
    end
