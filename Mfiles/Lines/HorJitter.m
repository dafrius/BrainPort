clear all
clearvars

jitterhori=fopen([pwd filesep 'Static' filesep 'HBotLR-S-Static.txt'],'w');


for i=1:15
    imgJhori=zeros(20,20); %%%MidCent
    imgJhori(10:11,3:18)=255;
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
    
    imgJhori=zeros(20,20); %%%MidRight
    imgJhori(10:11,4:19)=255;
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
    
    imgJhori=zeros(20,20); %%%MidLeft
    imgJhori(10:11,2:17)=255;
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
    
    imgJhori=zeros(20,20); %%%BotCent
    imgJhori(11:12,3:18)=255;
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
    
    imgJhori=zeros(20,20);
    imgJhori(11:12,4:19)=255; %%%BotRight
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
    
    imgJhori=zeros(20,20);
    imgJhori(11:12,2:17)=255; %%%BotRight
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
    
    imgJhori=zeros(20,20); %%%TopCent
    imgJhori(9:10,3:18)=255;
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
    
    imgJhori=zeros(20,20); %%%TopLeft
    imgJhori(9:10,2:17)=255;
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
    
    imgJhori=zeros(20,20); %%%TopRight
    imgJhori(9:10,4:19)=255;
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
end