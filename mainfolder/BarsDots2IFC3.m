%%
clear

answr=inputdlg({'Enter Subject ID: '},'ID',[1 45]);

output=fopen([answr{1} '.xls'],'a');


fprintf(output, 'TrialNo\t Staircase\t 1stInterval\t 2ndInterval\t Accuracy\t Spacing\n');

%%
%Stimulus - Device Preparation

load twoifcmatrix1.mat twoifcmatrix1

fileNames=twoifcmatrix1.filenames;
stimTypes=twoifcmatrix1.stimtype;
colStart=twoifcmatrix1.colStart;

commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1,'-echo');


%%
%Keyboard keys

KbName('UnifyKeyNames');
FalseKey=KbName('n');
TrueKey=KbName('y');
spaceKey = KbName('space');
escKey = KbName('ESCAPE');
nextKey = KbName ('1!');
nextKey2 = KbName ('9(');
fixKey= KbName('f');
quickfixKey=KbName('q');
quickansKey=KbName('p');

%%
%Trial Loop

steps=1;
stepsback=9;
spacing1=16;
spacing2=0;
corRespUp=0;
corRespDown=0;
upStaircase=[1 1];
downStaircase=[0 0];
trialSteps=[1 9];
upReversal=0;
downReversal=0;
trialNo=1;

bardotmat=[0 1];


while (upReversal>0 && downReversal>0)==0
    if round(rand)<1
        while 1 %next/quit
            [keyIsDown, secs, keyCode] = KbCheck;
            FlushEvents('keyDown');
            if keyIsDown
                if keyCode(nextKey)
                    break;
                elseif keyCode(fixKey)
                    system(commm2, '-echo');
                elseif keyCode(quickfixKey)
                    continue
                elseif keyCode(escKey)
                    return
                end
            end
        end
        
        if round(rand)<1
            fprintf('Is the bar on first or second?\n');
            startKey=0;
            WaitSecs(.5);
            
            filename1=fileNames{steps*2-1};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename1 '>client.in'];
            system(commm2, '-echo');
            fprintf('1.Bar, %d spacing.\n', spacing1)
            WaitSecs(1);
            system(commm2, '-echo');
            WaitSecs(2);
            
            filename2=fileNames{steps*2};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename2 '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Dots, %d spacing.\n', spacing1)
            WaitSecs(1);
            system(commm2, '-echo');
            
            fprintf('The answer was, 1. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        corRespUp=corRespUp+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        corRespUp=0;
                        if steps>1
                            steps=steps-1; 
                            spacing1=spacing1+2;
                        end               
                        upStaircase=[upStaircase 0]; 
                        trialSteps=[trialSteps steps];
                        if upStaircase(end)~= upStaircase(end-1)
                        upReversal=upReversal+1;
                        fprintf('UpReversal = %d.\n\n', upReversal)
                        end
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            fprintf(output, '%d\t 1\t %s\t %s\t %d\t %d\n', trialNo, filename1(1:end-4), filename2(1:end-4),  acc, spacing1);
            WaitSecs(.7);
        else
            filename1=fileNames{steps*2};
            fprintf('Is the bar on first or second?\n');
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename1 '>client.in'];
            system(commm2, '-echo');
            fprintf('1.Dots, %d spacing.\n', spacing1)
            WaitSecs(1);
            system(commm2, '-echo');
            
            WaitSecs(2);
            
            filename2=fileNames{steps*2-1};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename2 '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Bar, %d spacing.\n', spacing1)
            WaitSecs(1);
            system(commm2, '-echo');
            
            fprintf('The answer was, 2. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        corRespUp=corRespUp+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        corRespUp=0;
                        if steps >1
                            steps=steps-1;
                            spacing1=spacing1+2;
                        end
                        upStaircase=[upStaircase 0];
                        trialSteps=[trialSteps steps];
                        if upStaircase(end)~= upStaircase(end-1)
                        upReversal=upReversal+1;
                        fprintf('UpReversal = %d.\n\n', upReversal)
                        end
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            fprintf(output, '%d\t 1\t %s\t %s\t %d\t %d\n', trialNo, filename1(1:end-4), filename2(1:end-4),  acc, spacing1);
            WaitSecs(.7);
        end
        if corRespUp==3
            steps=steps+1;
            corRespUp=0;
            upStaircase=[upStaircase 1];
            trialSteps=[trialSteps steps];
            fprintf('One step up.\n\n')
            spacing1=spacing1-2;
            if upStaircase(end)==upStaircase(end)~= upStaircase(end-1)
            upReversal=upReversal+1;
            fprintf('UpReversal = %d.\n\n', upReversal)
            end
        end
        startKey=0;
        
        while 1 %next/quit
            [keyIsDown, secs, keyCode] = KbCheck;
            FlushEvents('keyDown');
            if keyIsDown
                if keyCode(nextKey)
                    break;
                elseif keyCode(fixKey)
                    system(commm2, '-echo');
                elseif keyCode(quickfixKey)
                    continue
                elseif keyCode(escKey)
                    return
                end
            end
        end
        
        if round(rand)<1
            while 1 %next/quit
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(nextKey)
                        break;
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(quickfixKey)
                        continue
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            fprintf('Is the bar on first or second?\n');
            startKey=0;
            WaitSecs(.5);
            
            filename1=fileNames{stepsback*2-1};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename1 '>client.in'];
            system(commm2, '-echo');
            fprintf('1.Bar, %d spacing.\n', spacing2)
            WaitSecs(1);
            system(commm2, '-echo');
            WaitSecs(2);
            
            filename2=fileNames{stepsback*2};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename2 '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Dots, %d spacing.\n', spacing2)
            WaitSecs(1);
            system(commm2, '-echo');
            
            fprintf('The answer was, 1. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        corRespDown=corRespDown+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        corRespDown=0;
                        stepsback=stepsback-1;
                        downStaircase=[downStaircase 0];
                        trialSteps=[trialSteps stepsback];
                        spacing2=spacing+2;
                        if downStaircase(end)~= downStaircase(end-1)
                        downReversal=downReversal+1;
                        fprintf('downReversal = %d.\n\n', downReversal)
                        end
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            fprintf(output, '%d\t 2\t %s\t %s\t %d\t %d\n', trialNo, filename1(1:end-4), filename2(1:end-4),  acc, spacing2);
            WaitSecs(.7);
        else
            filename1=fileNames{stepsback*2};
            fprintf('Is the bar on first or second?\n');
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename1 '>client.in'];
            system(commm2, '-echo');
            fprintf('1.Dots, %d spacing.\n', spacing2)
            WaitSecs(1);
            system(commm2, '-echo');
            
            WaitSecs(2);
            
            filename2=fileNames{stepsback*2-1};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename2 '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Bar, %d spacing.\n', spacing2)
            WaitSecs(1);
            system(commm2, '-echo');
            
            fprintf('The answer was, 2. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        corRespDown=corRespDown+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        corRespDown=0;
                        stepsback=stepsback-1;
                        downStaircase=[downStaircase 0];
                        trialSteps=[trialSteps stepsback];
                        spacing2=spacing2+2;
                        if downStaircase(end)~= downStaircase(end-1)
                        downReversal=downReversal+1;
                        fprintf('downReversal = %d.\n\n', downReversal)
                        end
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            WaitSecs(.7);
            fprintf(output, '%d\t 2\t %s\t %s\t %d\t %d\n', trialNo, filename1(1:end-4), filename2(1:end-4),  acc, spacing2);
        end
        
        if corRespDown==3
            if stepsback<9
            stepsback=stepsback+1;
            spacing2=spacing2-2;
            end
            corRespDown=0;
            downStaircase=[downStaircase 1];
            trialSteps=[trialSteps stepsback];
            fprintf('One step up.\n\n')
            if downStaircase(end)~= downStaircase(end-1)
            downReversal=downReversal+1;
            fprintf('downReversal = %d.\n\n', downReversal)
            end
        end
        startKey=0;
    else
        
        while 1 %next/quit
            [keyIsDown, secs, keyCode] = KbCheck;
            FlushEvents('keyDown');
            if keyIsDown
                if keyCode(nextKey)
                    break;
                elseif keyCode(fixKey)
                    system(commm2, '-echo');
                elseif keyCode(quickfixKey)
                    continue
                elseif keyCode(escKey)
                    return
                end
            end
        end
        if round(rand)<1
            while 1 %next/quit
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(nextKey)
                        break;
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(quickfixKey)
                        continue
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            fprintf('Is the bar on first or second?\n');
            startKey=0;
            WaitSecs(.5);
            
            filename1=fileNames{stepsback*2-1};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename1 '>client.in'];
            system(commm2, '-echo');
            fprintf('1.Bar, %d spacing.\n', spacing2)
            WaitSecs(1);
            system(commm2, '-echo');
            WaitSecs(2);
            
            filename2=fileNames{stepsback*2};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename2 '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Dots, %d spacing.\n', spacing2)
            WaitSecs(1);
            system(commm2, '-echo');
            
            fprintf('The answer was, 1. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        corRespDown=corRespDown+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        corRespDown=0;
                        stepsback=stepsback-1;
                        spacing2=spacing2+2;
                        downStaircase=[downStaircase 0];         
                        trialSteps=[trialSteps stepsback];
                        if downStaircase(end)~= downStaircase(end-1)
                        downReversal=downReversal+1;
                        fprintf('downReversal = %d.\n\n', downReversal)
                        end
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            fprintf(output, '%d\t 2\t %s\t %s\t %d\t %d\n', trialNo, filename1(1:end-4), filename2(1:end-4),  acc, spacing2);
            WaitSecs(.7);
        else
            filename1=fileNames{stepsback*2};
            fprintf('Is the bar on first or second?\n');
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename1 '>client.in'];
            system(commm2, '-echo');
            fprintf('1.Dots, %d spacing.\n', spacing2)
            WaitSecs(1);
            system(commm2, '-echo');
            
            WaitSecs(2);
            
            filename2=fileNames{stepsback*2-1};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename2 '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Bar, %d spacing.\n', spacing2)
            WaitSecs(1);
            system(commm2, '-echo');
            
            fprintf('The answer was, 2. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        corRespDown=corRespDown+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        corRespDown=0;
                        stepsback=stepsback-1;
                        spacing2=spacing2+2;
                        downStaircase=[downStaircase 0];    
                        trialSteps=[trialSteps stepsback];
                        if downStaircase(end)~= downStaircase(end-1)
                        downReversal=downReversal+1;
                        fprintf('downReversal = %d.\n\n', downReversal)
                        end    
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            fprintf(output, '%d\t 2\t %s\t %s\t %d\t %d\n', trialNo, filename1(1:end-4), filename2(1:end-4),  acc, spacing2);
            WaitSecs(.7);
        end
        
        if corRespDown==3
            if stepsback<9
            stepsback=stepsback+1;
            spacing2=spacing2-2;
            end
            corRespDown=0;
            downStaircase=[downStaircase 1];
            fprintf('One step up.\n\n')
            if downStaircase(end)~= downStaircase(end-1)
            downReversal=downReversal+1;
            fprintf('downReversal = %d.\n\n', downReversal)
            end
        end
        startKey=0;
        while 1 %next/quit
            [keyIsDown, secs, keyCode] = KbCheck;
            FlushEvents('keyDown');
            if keyIsDown
                if keyCode(nextKey)
                    break;
                elseif keyCode(fixKey)
                    system(commm2, '-echo');
                elseif keyCode(quickfixKey)
                    continue
                elseif keyCode(escKey)
                    return
                end
            end
        end
        if round(rand)<1
            fprintf('Is the bar on first or second?\n');
            startKey=0;
            WaitSecs(.5);
            
            filename1=fileNames{steps*2-1};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename1 '>client.in'];
            system(commm2, '-echo');
            fprintf('1.Bar, %d spacing.\n', spacing1)
            WaitSecs(1);
            system(commm2, '-echo');
            WaitSecs(2);
            
            filename2=fileNames{steps*2};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename2 '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Dots, %d spacing.\n', spacing1)
            WaitSecs(1);
            system(commm2, '-echo');
            
            fprintf('The answer was, 1. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        corRespUp=corRespUp+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        corRespUp=0;
                        if steps>1
                            steps=steps-1;
                            spacing1=spacing1+2;
                        end
                        upStaircase=[upStaircase 0];     
                        trialSteps=[trialSteps steps];
                        
                        if upStaircase(end)~= upStaircase(end-1)
                        upReversal=upReversal+1;
                        fprintf('UpReversal = %d.\n\n', upReversal)
                        end
                        
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            fprintf(output, '%d\t 1\t %s\t %s\t %d\t %d\n', trialNo, filename1(1:end-4), filename2(1:end-4),  acc, spacing1);
            WaitSecs(.7);
        else
            filename1=fileNames{steps*2};
            fprintf('Is the bar on first or second?\n');
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename1 '>client.in'];
            system(commm2, '-echo');
            fprintf('1.Dots, %d spacing.\n', spacing1)
            WaitSecs(1);
            system(commm2, '-echo');
            
            WaitSecs(2);
            
            filename2=fileNames{steps*2-1};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCStimuli-5thRow\\' filename2 '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Bar, %d spacing.\n', spacing1)
            WaitSecs(1);
            system(commm2, '-echo');
            
            fprintf('The answer was, 2. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        corRespUp=corRespUp+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        corRespUp=0;
                        if steps >1
                            steps=steps-1;
                        end
                        spacing1=spacing1+2;
                        upStaircase=[upStaircase 0];
                        trialSteps=[trialSteps steps];
                        if upStaircase(end)~= upStaircase(end-1)
                        upReversal=upReversal+1;
                        fprintf('UpReversal = %d.\n\n', upReversal)
                        end
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            fprintf(output, '%d\t 1\t %s\t %s\t %d\t %d\n', trialNo, filename1(1:end-4), filename2(1:end-4), acc, spacing1);
            WaitSecs(.7);
        end
        if corRespUp==3
            steps=steps+1;
            spacing1=spacing1-2;
            corRespUp=0;
            upStaircase=[upStaircase 1];
            trialSteps=[trialSteps steps];
            fprintf('One step up.\n\n')
            
            if upStaircase(end)~= upStaircase(end-1)
            upReversal=upReversal+1;
            fprintf('UpReversal = %d.\n\n', upReversal)
            end
        end
        startKey=0;
        
    end
    
end
fclose(output);