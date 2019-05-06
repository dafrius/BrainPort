clear all
clearvars

answr1=inputdlg({'Stimtype: 1=Static 2=PixByPix'},'Enter stimulus drawing type',[1,17] ,{'1'});
opt=str2double(answr1{1});

if opt == 1
     framerate=1;
else
    answr2=inputdlg({'Framerate:'},'Enter Framerate',[1 17],{'5'});
    fra=str2double(answr2{1});
    framerate=fra;
end

for intlevel=5:5:255
    imgHTLR=zeros(20,20);
    if opt == 1
        movingHTLR=fopen([pwd filesep 'HMidLR-S-Static-' num2str(intlevel) '.txt' ],'w');
    elseif opt == 2
        movingHTLR=fopen([pwd filesep 'HTopLR-S-PixByPix-FR' num2str(framerate) '-' num2str(intlevel) '.txt'],'w');
    end
    
    for x=1:20
        for fr=1:framerate
            imgHTLR(5:6,x)=intlevel;
            if opt == 2
                fwrite(movingHTLR, transpose(imgHTLR));
            end
        end
    end
    
    
    if opt == 1
        fwrite(movingHTLR, transpose(imgHTLR));
        imshow(imgHTLR);
    end
    fclose(movingHTLR);
end