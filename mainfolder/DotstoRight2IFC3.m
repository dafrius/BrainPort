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


samedotind=1; samedotloc=10;
steps1=2; actloc1=11; strc1Cor=0; strc1Rev=0; strc1Steps=[]; strc1UD=[];
steps2=11; actloc2=20; strc2Cor=0; strc2Rev=0; strc2Steps=[]; strc2UD=[];

trialSteps=[]; trialNo=0; crash=0;
levels=[zeros(1,9) 10 11 12 13 14 15 16 17 18 19 20; zeros(1,20)];
trialMat=[];
for i=1:25
trialMat=[trialMat Shuffle([0 0 1 2])];
end




while trialNo<100
    trialNo=trialNo+1;
    if trialMat(trialNo)==0 %Same location dot 
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
        
        filename=fileNames{samedotind};
        commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCDotsMovingToRight\\' filename '>client.in'];
        system(commm2, '-echo');
        fprintf('2.Dot, %d. column.\n', samedotloc)
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
                    break
                elseif keyCode(FalseKey)
                    fprintf('The answer was incorrect.\n')
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
        staircase=0;
        spacing=samedotloc;
    elseif trialMat(trialNo)==1 %Staircase 1 - starting from 11th column.
        
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

        filename=fileNames{steps1};
        commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCDotsMovingToRight\\' filename '>client.in'];
        system(commm2, '-echo');
        fprintf('2.Dot, %d. column.\n', actloc1)
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
                    strc1Cor=strc1Cor+1;
                    strc1Steps=[strc1Steps actloc1];
                    break
                elseif keyCode(FalseKey)
                    fprintf('The answer was incorrect. One pixel farther.\n')
                    acc=0;
                    strc1Cor=0;
                    strc1Steps=[strc1Steps actloc1];
                    strc1UD=[strc1UD 0];
                    if length(strc1UD)>1
                            if strc1UD(end)~= strc1UD(end-1)
                            strCase1Rev=strCase1Rev+1;
                            fprintf('strCase1Rev = %d.\n\n', strCase1Rev)
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
        staircase=1;
        spacing=actloc1;
    elseif trialMat(trialNo)==2 %Staircase 2 starting from 20th column.
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
        
        filename=fileNames{steps2};
        commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCDotsMovingToRight\\' filename '>client.in'];
        system(commm2, '-echo');
        fprintf('2.Dot, %d. column.\n', actloc2)
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
                    strc2Cor=strc2Cor+1;
                    strc2Steps=[strc2Steps actloc2];
                    break
                elseif keyCode(FalseKey)
                    fprintf('The answer was incorrect. One pixel farther.\n')
                    acc=0;
                    strc2Cor=0;
                    strc2Steps=[strc2Steps actloc2];
                    strc2UD=[strc2UD 0];
                    if length(strc2UD)>1
                            if strc2UD(end)~= strc2UD(end-1)
                            strCase2Rev=strCase2Rev+1;
                            fprintf('strCase2Rev = %d.\n\n', strCase2Rev)
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
        staircase=2;
        spacing=actloc2;
    end
    if crash
        crash=0;
        trialNo=trialNo-1;
        continue
    end
    fprintf(output, '\n%d\t %d\t %s\t %d\t %d\t %d', trialNo, staircase, filename(1:end-4), acc, spacing);
    
    if acc
        if trialMat(trialNo)==1
            if strc1Cor==3
                if steps1>2
                    steps1=steps1-1;
                    actloc1=actloc1-1;
                    strc1Cor=0;
                    fprintf('Staircase 1 - One pixel closer\n')
                    if length(strc1UD)>1
                            if strc1UD(end)~= strc1UD(end-1)
                            strCase1Rev=strCase1Rev+1;
                            fprintf('strCase1Rev = %d.\n\n', strCase1Rev)
                            end
                    end
                end
            end
        elseif trialMat(trialNo)==2
            if strc2Cor==3
                if steps2>2
                    steps2=steps2-1;
                    actloc2=actloc2-1;
                    strc2Cor=0;
                    fprintf('Staircase 2 - One pixel closer\n')
                    if length(strc2UD)>1
                            if strc2UD(end)~= strc2UD(end-1)
                            strCase2Rev=strCase2Rev+1;
                            fprintf('strCase2Rev = %d.\n\n', strCase2Rev)
                            end
                    end
                end
            end
        end
    else 
        if trialMat(trialNo)==1
            steps1=steps1+1;
            actloc1=actloc1+1;
        elseif trialMat(trialNo)==2
            steps2=steps2+1;
            actloc2=actloc2+1;
        end
    end
    
    
    WaitSecs(.7);
                    
end
    


strc1Steps=[strc1Steps actloc1];
strc2Steps=[strc2Steps actloc2];

a=plot(strc1Steps);
plot(strc1Steps)
title([answr{1} '-5th Row 2PD Threshold Staircases'])
xlabel('Order');
ylabel('Spacing');

ylim([8 22])
hold on
a=plot(strc2Steps);
plot(strc2Steps)
hold off
saveas(a,[answr{1} '.png']);
fclose(output);