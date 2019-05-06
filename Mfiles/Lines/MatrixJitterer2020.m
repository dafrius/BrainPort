clear

jitterhori=fopen([pwd filesep 'DR225-2.txt'],'w');

%%
%Left Diagonal 45deg
% nonjitterimage=zeros(20,20);
% 
% i=3;
% j=3;
% nonjitterimage(3,3)=255;%%DiagL
% for x=3:17
%     nonjitterimage(i,j+1)=255;
%     nonjitterimage(i+1,j:j+1)=255;
%     i=i+1;
%     j=j+1;
% end
% fwrite(jitterhori, transpose(nonjitterimage));
%%
%Horizontal/Vertical
nonjitterimage=zeros(20,20);
nonjitterimage(10:11,3:18)=255;%Hori 
% nonjitterimage(3:18,3:4)=255;%Vert
fwrite(jitterhori, transpose(nonjitterimage));
%%
%Right Diagonal 45 deg
% nonjitterimage=zeros(20,20);
% i=3;
% j=18;
% nonjitterimage(3,18)=255;
% for x=3:17
%         nonjitterimage(i+1,j-1:j)=255;
%         nonjitterimage(i,j-1)=255;
%     i=i+1;
%     j=j-1;
% end
% fwrite(jitterhori, transpose(nonjitterimage));
%%
%Left Diagonal 30 deg
% nonjitterimage=zeros(20,20);
% nonjitterimage(3,5:7)=255;
% nonjitterimage(4,6:8)=255;
% nonjitterimage(5:6,7:9)=255;
% nonjitterimage(7:8,8:10)=255;
% nonjitterimage(9:10,9:11)=255;
% nonjitterimage(11,10:12)=255;
% nonjitterimage(12:13,11:13)=255;
% nonjitterimage(14:15,12:14)=255;
% nonjitterimage(16:17,13:15)=255;
% nonjitterimage(18,14:16)=255;
% %  fwrite(jitterhori, transpose(nonjitterimage));
%%
%Right Diagonal 30 deg
% nonjitterimage=zeros(20,20);
% nonjitterimage(3,13:15)=255;
% nonjitterimage(4,12:14)=255;
% nonjitterimage(5:6,11:13)=255;
% nonjitterimage(7:8,10:12)=255;
% nonjitterimage(9:10,9:11)=255;
% nonjitterimage(11,8:10)=255;
% nonjitterimage(12:13,7:9)=255;
% nonjitterimage(14:15,6:8)=255;
% nonjitterimage(16:17,5:7)=255;
% nonjitterimage(18,4:6)=255;
% % fwrite(jitterhori, transpose(nonjitterimage));
%%
%Left Diagonal 22.5 deg mid
% nonjitterimage=zeros(20,20);
% nonjitterimage(3:4,3:4)=255;
% nonjitterimage(5:6,4:5)=255;
% nonjitterimage(7:8,5:6)=255;
% nonjitterimage(9:10,6:7)=255;
% nonjitterimage(11:12,7:8)=255;
% nonjitterimage(13:14,8:9)=255;
% nonjitterimage(15:16,9:10)=255;
% nonjitterimage(17:18,10:11)=255;
% % fwrite(jitterhori, transpose(nonjitterimage));
% imshow(nonjitterimage);
%%
% Left Diagonal 22.5 deg mid second
% nonjitterimage=zeros(20,20);
% nonjitterimage(3:4,10:11)=255;
% nonjitterimage(5:6,11:12)=255;
% nonjitterimage(7:8,12:13)=255;
% nonjitterimage(9:10,13:14)=255;
% nonjitterimage(11:12,14:15)=255;
% nonjitterimage(13:14,15:16)=255;
% nonjitterimage(15:16,16:17)=255;
% nonjitterimage(17:18,17:18)=255;
% % fwrite(jitterhori, transpose(nonjitterimage));
% imshow(nonjitterimage);
%%
%Right Diagonal 22.5 deg mid
% nonjitterimage=zeros(20,20);
% nonjitterimage(3:4,17:18)=255;
% nonjitterimage(5:6,16:17)=255;
% nonjitterimage(7:8,15:16)=255;
% nonjitterimage(9:10,14:15)=255;
% nonjitterimage(11:12,13:14)=255;
% nonjitterimage(13:14,12:13)=255;
% nonjitterimage(15:16,11:12)=255;
% nonjitterimage(17:18,10:11)=255;
% % fwrite(jitterhori, transpose(nonjitterimage));
% imshow(nonjitterimage);
%%
%Right Diagonal 22.5 deg mid second
% nonjitterimage=zeros(20,20);
% nonjitterimage(3:4,10:11)=255;
% nonjitterimage(5:6,9:10)=255;
% nonjitterimage(7:8,8:9)=255;
% nonjitterimage(9:10,7:8)=255;
% nonjitterimage(11:12,6:7)=255;
% nonjitterimage(13:14,5:6)=255;
% nonjitterimage(15:16,4:5)=255;
% nonjitterimage(17:18,3:4)=255;
% % fwrite(jitterhori, transpose(nonjitterimage));
% imshow(nonjitterimage);
%%
%Frontal tongue Horizontal
% nonjitterimage=zeros(20,20);
% nonjitterimage(3:4,3:18)=255;
%   fwrite(jitterhori, transpose(nonjitterimage));


%%
for i=1:15
    immat=Shuffle(1:9);
    for j=1:9
    %%%MidCent
        if immat(j)==5
        imgJhori=zeros(20,20);                 
        imgJhori(3:18,3:18)=nonjitterimage(3:18,3:18);
        fwrite(jitterhori, transpose(imgJhori));
        imshow(imgJhori);
        end
    
    %%%MidRight
        if immat(j)==6
    imgJhori=zeros(20,20);                 
    imgJhori(3:18,4:19)=nonjitterimage(3:18,3:18);
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
        end
        
    %MidLeft
        if immat(j)==4
    imgJhori=zeros(20,20);                 
    imgJhori(3:18,2:17)=nonjitterimage(3:18,3:18);
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
        end
        
    %BotCent
        if immat(j)==8
    imgJhori=zeros(20,20);                 
    imgJhori(4:19,3:18)=nonjitterimage(3:18,3:18);
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
        end
       
    %BotLeft
        if immat(j)==7
    imgJhori=zeros(20,20);                 
    imgJhori(4:19,2:17)=nonjitterimage(3:18,3:18);
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
        end
        
    %BotRight
        if immat(j)==9
    imgJhori=zeros(20,20);                 
    imgJhori(4:19,4:19)=nonjitterimage(3:18,3:18);
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
        end
        
    %TopCent
        if immat(j)==2
    imgJhori=zeros(20,20);                 
    imgJhori(2:17,3:18)=nonjitterimage(3:18,3:18);
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
        end
        
    %TopRight
        if immat(j)==3
    imgJhori=zeros(20,20);                 
    imgJhori(2:17,4:19)=nonjitterimage(3:18,3:18);
    fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
        end
    
    %TopLeft
        if immat(j)==1
    imgJhori=zeros(20,20);                 
    imgJhori(2:17,2:17)=nonjitterimage(3:18,3:18);
%     fwrite(jitterhori, transpose(imgJhori));
    imshow(imgJhori);
        end
    end
end