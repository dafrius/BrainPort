%%
clear

answr=inputdlg({'Enter Subject ID: '},'ID',[1 45]);

output=fopen([answr{1} '.xls'],'a');


fprintf(output, 'TrialNo\t Staircase\t FileName\t Accuracy\t Spacing');

%%
%Stimulus - Device Preparation

load dotMatrix2.mat dotMatrix2

fileNames=dotMatrix2.filenames;

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

firststep=1; firstspacing=10;
steps=2; spacing1=11; strc1CorResp=0; stairCase1=[]; strCase1R=0; strc1Steps=[]; strc1count=0;
stepsback=11; spacing2=20; strc2CorResp=0; stairCase2=[]; strCase2R=0; strc2Steps=[]; strc2count=0;

trialSteps=[1 11];
trialNo=0;
crash=0;
levels=[10 11 12 13 14 15 16 17 18 19 20];

samediffmat=sort(repmat(0:1,1,2));
strcasemat=repmat(0:1,1,2);
trialMat=[samediffmat; strcasemat];
randomizer=randperm(length(trialMat));
trialMat=trialMat(:,randomizer);

while (strCase1R>2 && strCase2R>2)==0
    trialNo=trialNo+1;
    if trialMat(1,trialNo)==0 %sameloc
        
        fprintf('Press to start.\n Is the second dot at the same or different location?\n');
        while 1 %next/quit
            [keyIsDown, secs, keyCode] = KbCheck;
            FlushEvents('keyDown');
            if keyIsDown
                if keyCode(nextKey)
                    break;
                elseif keyCode(fixKey)
                    system(commm2, '-echo');
                elseif keyCode(escKey)
                    fclose(output);
                    return
                end
            end
        end
        
        filename=fileNames{firststep};
        commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCDotsMovingToRight\\' filename '>client.in'];
        system(commm2, '-echo');
        fprintf('2.Dot, %d. column.\n', firstspacing)
        WaitSecs(4.05);
        system(commm2, '-echo');
        
        fprintf('Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
        while 1
            %keyIsDown=0;
            [keyIsDown, keyTime, keyCode]=KbCheck;
            FlushEvents('keyDown');
            if keyIsDown
                if keyCode(TrueKey)
                    fprintf('The answer was correct.\n\n')
                    acc=1;
                    break
                elseif keyCode(FalseKey)
                    fprintf('The answer was incorrect.\n One step down.\n\n')
                    acc=0;
                    break
                elseif keyCode(fixKey)
                    system(commm2, '-echo');
                elseif keyCode(quickfixKey)
                    crash=1;
                    break
                elseif keyCode(escKey)
                    fclose(output);
                    return
                end
            end
        end
    else
        if trialMat(2,trialNo)==0 %strcase1
            strc1count=strc1count+1;
            fprintf('Press to start.\n Is the second dot at the same or different location?\n');
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
                        fclose(output);
                        return
                    end
                end
            end
            startKey=0;
            WaitSecs(.5);
            
            filename=fileNames{steps};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCDotsMovingToRight\\' filename '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Dot, %d. column.\n', spacing1)
            WaitSecs(4.05);
            system(commm2, '-echo');
            
            
            
            fprintf('Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n')
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
                        fclose(output);
                        return
                    end
                end
            end
        else %strcase2
            strc2count=strc2count+1;
            fprintf('Press to start.\n Is the second dot at the same or different location?\n');
            while 1 %next/quit
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(nextKey)
                        break;
                    elseif keyCode(fixKey)
                        system(commm2, '-echo');
                    elseif keyCode(escKey)
                        fclose(output);
                        return
                    end
                end
            end
            
            startKey=0;
            WaitSecs(.5);
            
            filename=fileNames{stepsback};
            commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCDotsMovingToRight\\' filename '>client.in'];
            system(commm2, '-echo');
            fprintf('2.Dot, %d column.\n', spacing2)
            WaitSecs(4.05);
            system(commm2, '-echo');
            
            
            fprintf('Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n Press Q to start the trial over if the client crashed. \n\n')
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
                        fclose(output);
                        return
                    end
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
        if trialMat(2,trialNo)==0
            staircase=0;
            spacing=firstspacing;
        else
            if trialMat(1,trialNo)==0
                staircase=1;
                spacing=spacing1;
            else
                staircase=2;
                spacing=spacing2;
            end
        end
        fprintf(output, '\n%d\t %d\t %s\t %d\t %d\t %d', trialNo, staircase, filename(1:end-4),  acc, spacing);
    end
    
    if trialMat(1,trialNo)==1
        if trialMat(1,trialNo)==0
            
            strc1Steps=[strc1Steps spacing1];
            if acc==0
                if steps<11
                    steps=steps+1;
                    spacing1=spacing1+1;
                end
            end
            
            if strc1CorResp==3
                if steps>1
                    steps=steps-1;
                    spacing1=spacing1-1;
                    strc1CorResp=0;
                    stairCase1=[stairCase1 1];
                    trialSteps=[trialSteps steps];
                    fprintf('One step up.\n\n')
                end
                if length(stairCase1)>1
                    if stairCase1(end)~= stairCase1(end-1)
                        strCase1R=strCase1R+1;
                        fprintf('strCase1R = %d.\n\n', strCase1R)
                    end
                end
            end
        else
            strc2Steps=[strc2Steps spacing2];
            if acc==0
                if stepsback<11
                    stepsback=stepsback+1;
                    spacing2=spacing2+1;
                end
            end
            if strc2CorResp==3
                stepsback=stepsback-1;
                strc2CorResp=0;
                stairCase2=[stairCase2 1];
                trialSteps=[trialSteps stepsback];
                fprintf('One step up.\n\n')
                spacing2=spacing2-1;
                if length(stairCase2)>1
                    if stairCase2(end)~= stairCase2(end-1)
                        strCase2R=strCase2R+1;
                        fprintf('strCase2R = %d.\n\n', strCase2R)
                    end
                end
            end
            strc2Steps=[strc2Steps spacing2];
        end
        WaitSecs(.7);
        startKey=0;
        
        if mod(trialNo,4)==1
            strcasemat=repmat(0:1,1,2);
            samediffmat=sort(repmat(0:1,1,2));
            interimMat=[strcasemat;samediffmat];
            randomizer=randperm(length(interimMat));
            interimMat=interimMat(:,randomizer);
            trialMat=[trialMat interimMat];
        end
    end
end
