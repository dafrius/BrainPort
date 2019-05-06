KbName('UnifyKeyNames');
upKey= KbName('8');
downKey= KbName('2');
leftKey= KbName('4');
rightKey= KbName('6');
fixKey= KbName('f');
escKey = KbName('ESCAPE');


stimulusno=1;
intensity = 100;
while 1 
    
    commm1=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HTopLR-S-Static-' num2str(intensity) '.txt >client.in'];
    commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HMidLR-S-Static-' num2str(intensity) '.txt >client.in'];
    commm3=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HBotLR-S-Static-' num2str(intensity) '.txt >client.in'];
% 
    commm4=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HTopLR-S-PixByPix-FR7-' num2str(intensity) '.txt >client.in'];
    commm5=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HMidLR-S-PixByPix-FR7-' num2str(intensity) '.txt >client.in'];
    commm6=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\HBotLR-S-PixByPix-FR7-' num2str(intensity) '.txt >client.in'];

    commm7=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\TopBottom\\Bot80-Top' num2str(intensity) '.txt >client.in'];

    stimulustypes={[commm1] [commm2] [commm3] [commm4] [commm5] [commm6] [commm7]};

    currstim=stimulustypes{stimulusno};
        
    keyIsDown=0;
         [keyIsDown, keyTime, keyCode]=KbCheck;
         FlushEvents('keyDown');
         if keyIsDown
             if keyCode(fixKey)
                 system(currstim, '-echo');
             elseif keyCode(leftKey)
                 if stimulusno==1
                     stimulusno=7;
                     fprintf('Bot80-Top%d\n', intensity)
                 else
                 stimulusno=stimulusno-1;
                    if stimulusno==1
                        fprintf('TopStatic%d\n', intensity)
                    elseif stimulusno ==2
                        fprintf('MidStatic%d\n', intensity)
                    elseif stimulusno ==3
                        fprintf('BotStatic%d\n', intensity)
                    elseif stimulusno ==4
                        fprintf('TopMoving%d\n', intensity)
                    elseif stimulusno ==5
                        fprintf('MidMoving%d\n', intensity)
                    elseif stimulusno ==6
                        fprintf('BotMoving%d\n', intensity)
                    end
                 end
                 WaitSecs(.2);
             elseif keyCode(rightKey)
                 if stimulusno==7
                     stimulusno=1;
                     fprintf('TopStatic%d\n', intensity)
                 else
                     stimulusno=stimulusno+1;
                    if stimulusno ==2
                        fprintf('MidStatic%d\n', intensity)
                    elseif stimulusno ==3
                        fprintf('BotStatic%d\n', intensity)
                    elseif stimulusno ==4
                        fprintf('TopMoving%d\n', intensity)
                    elseif stimulusno ==5
                        fprintf('MidMoving%d\n', intensity)
                    elseif stimulusno ==6
                        fprintf('BotMoving%d\n', intensity)
                    elseif stimulusno ==7
                        fprintf('Bot80-Top%d\n', intensity)
                    end
                 end
                 WaitSecs(.2);
             elseif keyCode(upKey)
                 intensity=intensity+5;
                 if stimulusno ==2
                        fprintf('MidStatic%d\n', intensity)
                    elseif stimulusno ==3
                        fprintf('BotStatic%d\n', intensity)
                    elseif stimulusno ==4
                        fprintf('TopMoving%d\n', intensity)
                    elseif stimulusno ==5
                        fprintf('MidMoving%d\n', intensity)
                    elseif stimulusno ==6
                        fprintf('BotMoving%d\n', intensity)
                    elseif stimulusno ==7
                        fprintf('Bot80-Top%d\n', intensity)
                 elseif stimulusno ==1
                        fprintf('TopStatic%d\n', intensity)
                    end
                 WaitSecs(.2);
             elseif keyCode(downKey)
                 intensity=intensity-5;
                  if stimulusno ==2
                        fprintf('MidStatic%d\n', intensity)
                    elseif stimulusno ==3
                        fprintf('BotStatic%d\n', intensity)
                    elseif stimulusno ==4
                        fprintf('TopMoving%d\n', intensity)
                    elseif stimulusno ==5
                        fprintf('MidMoving%d\n', intensity)
                    elseif stimulusno ==6
                        fprintf('BotMoving%d\n', intensity)
                    elseif stimulusno ==7
                        fprintf('Bot80-Top%d\n', intensity)
                 elseif stimulusno ==1
                        fprintf('TopStatic%d\n', intensity)
                    end
                 WaitSecs(.2);
             elseif keyCode(escKey)
               return
             end
         end
end









