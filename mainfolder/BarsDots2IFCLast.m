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
strc1CorResp=0;
strc2CorResp=0;
stairCase1=[];
stairCase2=[];
trialSteps=[1 9];
strCase1R=0;
strCase2R=0;
strc1Steps=[];
strc2Steps=[];
trialNo=0;

strcasemat=repmat(0:1,1,2);
bardotmat=sort(repmat(0:1,1,2));
trialMat=[strcasemat; bardotmat];
randomizer=randperm(length(trialMat));
trialMat=trialMat(:,randomizer);
strc1count=0;
strc2count=0;
crash=0;

while (strCase1R>2 && strCase2R>2)==0
    trialNo=trialNo+1;
    if trialMat(1,trialNo)==0 %staircase1
        strc1count=strc1count+1;
        fprintf('Press to start.\n Is the bar on first or second?\n');
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
        startKey=0;
        WaitSecs(.5);
        
        if trialMat(2,trialNo)==0
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
                        strc1CorResp=strc1CorResp+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        strc1CorResp=0;
                        stairCase1=[stairCase1 0];
                        trialSteps=[trialSteps steps];
                        if length(stairCase1)>1
                            if stairCase1(end)~= stairCase1(end-1)
                            strCase1R=strCase1R+1;
                            fprintf('strCase1R = %d.\n\n', strCase1R)
                            end
                        end
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(quickfixKey)
                        crash=1;
                        break
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            
        else
            filename1=fileNames{steps*2};
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
                        strc1CorResp=strc1CorResp+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        strc1CorResp=0;
                        if steps >1
                            steps=steps-1;
                        end
                        stairCase1=[stairCase1 0];
                        trialSteps=[trialSteps steps];
                        if length(stairCase1)>1
                            if stairCase1(end)~= stairCase1(end-1)
                            strCase1R=strCase1R+1;
                            fprintf('strCase1R = %d.\n\n', strCase1R)
                            end
                        end
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');                       
                    elseif keyCode(quickfixKey)
                        crash=1;
                        break
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            
        end
        
        if crash
            crash=0;
            if trialNo~=0
                trialNo=trialNo-1;
            else
                trialNo=0;
            end
            continue
        else
            staircase=1;        
            fprintf(output, '%d\t %d\t %s\t %s\t %d\t %d\n', trialNo, staircase, filename1(1:end-4), filename2(1:end-4),  acc, spacing1);
        end
        
        strc1Steps=[strc1Steps spacing1];

        if acc==0
            if steps>1
            steps=steps-1;
            spacing1=spacing1+2;
            end
        end
        
        if strc1CorResp==3
            steps=steps+1;
            strc1CorResp=0;
            stairCase1=[stairCase1 1];
            trialSteps=[trialSteps steps];
            fprintf('One step up.\n\n')
            spacing1=spacing1-2;
            if length(stairCase1)>1
                if stairCase1(end)==stairCase1(end)~= stairCase1(end-1)
                strCase1R=strCase1R+1;
                fprintf('strCase1R = %d.\n\n', strCase1R)
                end
            end
        end
        WaitSecs(.7);
        startKey=0;
        

        
    else %staircase2
        strc2count=strc2count+1;
        fprintf('Press to start.\n Is the bar on first or second?\n');
        while 1 %next/quit
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(nextKey)
                        break;
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
          end

            startKey=0;
            WaitSecs(.5);
        if trialMat(2,trialNo)==0    
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
            
            fprintf('The answer was, 1. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n Press Q to start the trial over if the client crashed. \n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        strc2CorResp=strc2CorResp+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        strc2CorResp=0;
                        stairCase2=[stairCase2 0];
                        trialSteps=[trialSteps stepsback];
                        if length(stairCase2)>1
                            if stairCase2(end)~= stairCase2(end-1)
                            strCase2R=strCase2R+1;
                            fprintf('strCase2R = %d.\n\n', strCase2R)
                            end
                        end
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(quickfixKey)
                        crash=1;
                        break    
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            

        else

            filename1=fileNames{stepsback*2};
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
            
            fprintf('The answer was, 2. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n Press Q to start the trial over if the client crashed. \n\n')
            while 1
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        fprintf('The answer was correct.\n\n')
                        acc=1;
                        strc2CorResp=strc2CorResp+1;
                        break
                    elseif keyCode(FalseKey)
                        fprintf('The answer was incorrect.\n One step down.\n\n')
                        acc=0;
                        strc2CorResp=0;
                        stairCase2=[stairCase2 0];
                        trialSteps=[trialSteps stepsback];
                        if length(stairCase2)>1
                            if stairCase2(end)~= stairCase2(end-1)
                            strCase2R=strCase2R+1;
                            fprintf('strCase2R = %d.\n\n', strCase2R)
                            end
                        end
                        break
                    elseif keyCode(quickfixKey)
                        crash=1;
                        break
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        return
                    end
                end
            end
            
        end
        
        if crash
            crash=0;
            if trialNo~=0
                trialNo=trialNo-1;
            else
                trialNo=0;
            end
            continue
        else
            staircase=2;
            fprintf(output, '%d\t %d\t %s\t %s\t %d\t %d\n', trialNo, staircase, filename1(1:end-4), filename2(1:end-4),  acc, spacing2);
        end
        if acc==0
            if stepsback>1
            spacing2=spacing2+2;
            stepsback=stepsback-1;
            end
        end
        
        if strc2CorResp==3
            strc2CorResp=0;
            if stepsback<9
            stepsback=stepsback+1;
            spacing2=spacing2-2;
            end
            stairCase2=[stairCase2 1];
            
            trialSteps=[trialSteps stepsback];
            fprintf('One step up.\n\n')
            if length(stairCase2)>1
                if stairCase2(end)~= stairCase2(end-1)
                strCase2R=strCase2R+1;
                fprintf('strCase2R = %d.\n\n', strCase2R)
                end
            end
        end
        strc2Steps=[strc2Steps spacing2];
        WaitSecs(.7);
        startKey=0;
        
    end

    if mod(trialNo,4)==1
        strcasemat=repmat(0:1,1,2);
        bardotmat=sort(repmat(0:1,1,2));
        interimMat=[strcasemat;bardotmat];
        randomizer=randperm(length(interimMat));
        interimMat=interimMat(:,randomizer);
        trialMat=[trialMat interimMat];
    end
end
strc1Steps=[strc1Steps spacing1];
strc2Steps=[strc2Steps spacing2];

a=plot(strc1Steps);
plot(strc1Steps)
title([answr{1} '-5th Row 2PD Threshold Staircases'])
xlabel('Trial Number');
ylabel('Spacing');

ylim([0 18])
hold on
a=plot(strc2Steps);
plot(strc2Steps)
hold off
saveas(a,[answr{1} '.png']);
fclose(output);
            