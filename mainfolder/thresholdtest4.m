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
    
    commm1=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\1-2.20-19.' num2str(intensity) '.txt >client.in'];
    commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2-3.19-18.' num2str(intensity) '.txt >client.in'];
    commm3=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\3-4.18-17.' num2str(intensity) '.txt >client.in'];
    commm4=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\4-5.17-16.' num2str(intensity) '.txt >client.in'];
    commm5=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\5-6.16-15.' num2str(intensity) '.txt >client.in'];
    commm6=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\6-7.15-14.' num2str(intensity) '.txt >client.in'];
    commm7=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\7-8.14-13.' num2str(intensity) '.txt >client.in'];
    commm8=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\8-9.13-12.' num2str(intensity) '.txt >client.in'];
    commm9=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\9-10.12-11.' num2str(intensity) '.txt >client.in'];

    


    stimulustypes={[commm1] [commm2] [commm3] [commm4] [commm5] [commm6] [commm7] [commm8] [commm9]};

    currstim=stimulustypes{stimulusno};
        
    keyIsDown=0;
         [keyIsDown, keyTime, keyCode]=KbCheck;
         FlushEvents('keyDown');
         if keyIsDown
             if keyCode(fixKey)
                 system(currstim, '-echo');
             elseif keyCode(leftKey)
                 if stimulusno==1
                     stimulusno=9;
                     fprintf('9-10.12-11%d\n', intensity)
                 else
                 stimulusno=stimulusno-1;
                    if stimulusno==1
                        fprintf('1-2.20-19.%d\n', intensity)
                    elseif stimulusno ==2
                        fprintf('2-3.19-18.%d\n', intensity)
                    elseif stimulusno ==3
                        fprintf('3-4.18-17.%d\n', intensity)
                    elseif stimulusno ==4
                        fprintf('4-5.17-16.%d\n', intensity)
                    elseif stimulusno ==5
                        fprintf('5-6.16-15.%d\n', intensity)
                    elseif stimulusno ==6
                        fprintf('6-7.15-14.%d\n', intensity)
                    elseif stimulusno ==7
                        fprintf('7-8.14-13.%d\n', intensity)
                    elseif stimulusno ==8
                        fprintf('8-9.13-12.%d\n', intensity)                        
                    end
                 end
                 WaitSecs(.2);
             elseif keyCode(rightKey)
                 if stimulusno==9
                     stimulusno=1;
                     fprintf('1-2.20-19.%d\n', intensity)
                 else
                     stimulusno=stimulusno+1;
                    if stimulusno ==2
                        fprintf('2-3.19-18.%d\n', intensity)
                    elseif stimulusno ==3
                        fprintf('3-4.18-17.%d\n', intensity)
                    elseif stimulusno ==4
                        fprintf('4-5.17-16.%d\n', intensity)
                    elseif stimulusno ==5
                        fprintf('5-6.16-15.%d\n', intensity)
                    elseif stimulusno ==6
                        fprintf('6-7.15-14.%d\n', intensity)
                    elseif stimulusno ==7
                        fprintf('7-8.14-13.%d\n', intensity)
                    elseif stimulusno ==8
                        fprintf('8-9.13-12.%d\n', intensity)     
                    elseif stimulusno ==9
                        fprintf('9-10.12-11.%d\n', intensity)
                    end
                 end
                 WaitSecs(.2);
             elseif keyCode(upKey)
                 intensity=intensity+5;
                    if stimulusno==1
                     fprintf('1-2.20-19.%d\n', intensity)
                    elseif stimulusno ==2
                        fprintf('2-3.19-18.%d\n', intensity)
                    elseif stimulusno ==3
                        fprintf('3-4.18-17.%d\n', intensity)
                    elseif stimulusno ==4
                        fprintf('4-5.17-16.%d\n', intensity)
                    elseif stimulusno ==5
                        fprintf('5-6.16-15.%d\n', intensity)
                    elseif stimulusno ==6
                        fprintf('6-7.15-14.%d\n', intensity)
                    elseif stimulusno ==7
                        fprintf('7-8.14-13.%d\n', intensity)
                    elseif stimulusno ==8
                        fprintf('8-9.13-12.%d\n', intensity)     
                    elseif stimulusno ==9
                        fprintf('9-10.12-11.%d\n', intensity)
                    end
                 WaitSecs(.2);
             elseif keyCode(downKey)
                 intensity=intensity-5;
                     if stimulusno==1
                     fprintf('1-2.20-19.%d\n', intensity)
                    elseif stimulusno ==2
                        fprintf('2-3.19-18.%d\n', intensity)
                    elseif stimulusno ==3
                        fprintf('3-4.18-17.%d\n', intensity)
                    elseif stimulusno ==4
                        fprintf('4-5.17-16.%d\n', intensity)
                    elseif stimulusno ==5
                        fprintf('5-6.16-15.%d\n', intensity)
                    elseif stimulusno ==6
                        fprintf('6-7.15-14.%d\n', intensity)
                    elseif stimulusno ==7
                        fprintf('7-8.14-13.%d\n', intensity)
                    elseif stimulusno ==8
                        fprintf('8-9.13-12.%d\n', intensity)     
                    elseif stimulusno ==9
                        fprintf('9-10.12-11.%d\n', intensity)
                     end
                 WaitSecs(.2);
             elseif keyCode(escKey)
            return
            end
         end
end









