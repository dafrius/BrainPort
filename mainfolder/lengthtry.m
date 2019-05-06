KbName('UnifyKeyNames');
upKey= KbName('UpArrow');
botKey= KbName('DownArrow');
leftKey= KbName('LeftArrow');
rightKey= KbName('RightArrow');
fixKey= KbName('f');
escKey = KbName('ESCAPE');

commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCDotsMovingToRight\\10-10.255dot.txt >client.in'];
% 
while 1 
         %keyIsDown=0;
         [keyIsDown, keyTime, keyCode]=KbCheck;
         FlushEvents('keyDown');
         if keyIsDown
             if keyCode(fixKey)
                 
               system(commm2, '-echo');
               WaitSecs(4)
               system(commm2, '-echo');
               break
             elseif keyCode(escKey)
               return
             end
         end
end


% commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HTopLR-S-Static-75.txt >client.in'];
% commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HMidLR-S-Static-60.txt >client.in'];
% commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HBotLR-S-Static-50.txt >client.in'];
% 
% commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HTopLR-S-PixByPix-FR7-75.txt >client.in'];
% commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HMidLR-S-PixByPix-FR7-60.txt >client.in'];
% commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HBotLR-S-PixByPix-FR7-55.txt >client.in'];

% commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\TopBottom\\Bot80-Top90.txt >client.in'];



while 1 
         %keyIsDown=0;
         [keyIsDown, keyTime, keyCode]=KbCheck;
         FlushEvents('keyDown');
         if keyIsDown
             if keyCode(fixKey)
               system(commm2, '-echo');
             elseif keyCode(escKey)
               return
             end
         end
end



