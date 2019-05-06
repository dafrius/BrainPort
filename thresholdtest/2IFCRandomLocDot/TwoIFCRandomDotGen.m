clear all
clearvars


%29 frames is apprx. 1 second.

intlevel=255;
%%
%Startingleft-nextdotright

    for x=3:10
        if x<=8
            for i=1:11
                y=x+i-1;
                output=fopen([pwd filesep num2str(x) '-' num2str(y) '-dot.txt' ],'w');
                imgDots=zeros(20,20);
                for j=1:29
                    imgDots(5,x)=255;
                    fwrite(output, transpose(imgDots));
                end
                
                imgDots=zeros(20,20);
                for j=1:58
                fwrite(output, transpose(imgDots));
                end
        
                for j=1:29
                imgDots(5,y)=intlevel;
                fwrite(output, transpose(imgDots));
                end
                imgDots=zeros(20,20);
                for j=1:5
                fwrite(output, transpose(imgDots));
                end
                fclose(output);                
            end
        elseif x==9
            for i=1:10
                y=x+i-1;
                output=fopen([pwd filesep num2str(x) '-' num2str(y) '-dot.txt' ],'w');
                imgDots=zeros(20,20);
                for j=1:29
                    imgDots(5,x)=255;
                    fwrite(output, transpose(imgDots));
                end
                
                imgDots=zeros(20,20);
                for j=1:58
                fwrite(output, transpose(imgDots));
                end
        
                for j=1:29
                imgDots(5,y)=intlevel;
                fwrite(output, transpose(imgDots));
                end
                imgDots=zeros(20,20);
                for j=1:5
                fwrite(output, transpose(imgDots));
                end
                fclose(output);    
            end
        elseif x==10
            for i=1:9
                y=x+i-1;
                output=fopen([pwd filesep num2str(x) '-' num2str(y) '-dot.txt' ],'w');
                imgDots=zeros(20,20);
                for j=1:29
                    imgDots(5,x)=255;
                    fwrite(output, transpose(imgDots));
                end
                
                imgDots=zeros(20,20);
                for j=1:58
                fwrite(output, transpose(imgDots));
                end
        
                for j=1:29
                imgDots(5,y)=intlevel;
                fwrite(output, transpose(imgDots));
                end
                imgDots=zeros(20,20);
                for j=1:5
                fwrite(output, transpose(imgDots));
                end
                fclose(output);    
            end            
        end
    end
    
    %% 
%Startingleft-nextdotleft
t=0;
    for x=4:10
        t=t+1;
            for i=x-t:x-1
                y=i;
                output=fopen([pwd filesep num2str(x) '-' num2str(y) '-dot.txt' ],'w');
                imgDots=zeros(20,20);
                for j=1:29
                    imgDots(5,x)=255;
                    fwrite(output, transpose(imgDots));
                end
                
                imgDots=zeros(20,20);
                for j=1:58
                fwrite(output, transpose(imgDots));
                end
        
                for j=1:29
                imgDots(5,y)=intlevel;
                fwrite(output, transpose(imgDots));
                end
                imgDots=zeros(20,20);
                for j=1:5
                fwrite(output, transpose(imgDots));
                end
                fclose(output);                
            end
    end
    
    
    %% Startingright=nextdotleft
    for x=18:-1:10
        if x>=13
            for i=1:11
                y=x-i+1;
                output=fopen([pwd filesep num2str(x) '-' num2str(y) '-dot.txt' ],'w');
                imgDots=zeros(20,20);
                for j=1:29
                    imgDots(5,x)=255;
                    fwrite(output, transpose(imgDots));
                end
                
                imgDots=zeros(20,20);
                for j=1:58
                fwrite(output, transpose(imgDots));
                end
        
                for j=1:29
                imgDots(5,y)=intlevel;
                fwrite(output, transpose(imgDots));
                end
                imgDots=zeros(20,20);
                for j=1:5
                fwrite(output, transpose(imgDots));
                end
                fclose(output);                
            end
        elseif x==12
            for i=1:10
                y=x-i+1;
                output=fopen([pwd filesep num2str(x) '-' num2str(y) '-dot.txt' ],'w');
                imgDots=zeros(20,20);
                for j=1:29
                    imgDots(5,x)=255;
                    fwrite(output, transpose(imgDots));
                end
                
                imgDots=zeros(20,20);
                for j=1:58
                fwrite(output, transpose(imgDots));
                end
        
                for j=1:29
                imgDots(5,y)=intlevel;
                fwrite(output, transpose(imgDots));
                end
                imgDots=zeros(20,20);
                for j=1:5
                fwrite(output, transpose(imgDots));
                end
                fclose(output);    
            end
        elseif x==11
            for i=1:9
                y=x-i+1;
                output=fopen([pwd filesep num2str(x) '-' num2str(y) '-dot.txt' ],'w');
                imgDots=zeros(20,20);
                for j=1:29
                    imgDots(5,x)=255;
                    fwrite(output, transpose(imgDots));
                end
                
                imgDots=zeros(20,20);
                for j=1:58
                fwrite(output, transpose(imgDots));
                end
        
                for j=1:29
                imgDots(5,y)=intlevel;
                fwrite(output, transpose(imgDots));
                end
                imgDots=zeros(20,20);
                for j=1:5
                fwrite(output, transpose(imgDots));
                end
                fclose(output);    
            end            
        end
    end
    
        %% 
%Startingright-nextdotright
t=0;
    for x=17:-1:11
        t=t+1;
            for i=x+1:x+t
                y=i;
                output=fopen([pwd filesep num2str(x) '-' num2str(y) '-dot.txt' ],'w');
                imgDots=zeros(20,20);
                for j=1:29
                    imgDots(5,x)=255;
                    fwrite(output, transpose(imgDots));
                end
                
                imgDots=zeros(20,20);
                for j=1:58
                fwrite(output, transpose(imgDots));
                end
        
                for j=1:29
                imgDots(5,y)=intlevel;
                fwrite(output, transpose(imgDots));
                end
                imgDots=zeros(20,20);
                for j=1:5
                fwrite(output, transpose(imgDots));
                end
                fclose(output);                
            end
    end
    