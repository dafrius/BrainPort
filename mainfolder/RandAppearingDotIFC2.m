%r=randomloc
%a=strc1steps
%b=strc2steps
%%
clear

answr=inputdlg({'Enter Subject ID: '},'ID',[1 45]);

output=fopen([answr{1} '.xls'],'a');


fprintf(output, 'TrialNo\t Staircase\t FileName\t Accuracy\t Spacing');


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
%% %%
%Stimulus - Device Preparation

commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1,'-echo');

trialMat1=repmat(3:18,1,4); %column Number
trialMat21=sort(repmat(0:1,1,8)); 
trialMat21=repmat(trialMat21,1,2);
trialMat22=sort(repmat(0:1,1,8), 'descend');
trialMat22=repmat(trialMat22,1,2); %same-different location
trialMat31=[zeros(1,8) sort(repmat(1:2,1,4))];
trialMat32=[zeros(1,8) sort(repmat(1:2,1,4), 'descend')];
trialMat33=[sort(repmat(1:2,1,4)) zeros(1,8)];
trialMat34=[sort(repmat(1:2,1,4), 'descend') zeros(1,8)]; %staircase 1,2 or 0=same location Staircase 1 starts from closer distance, 2 starts from farther
trialMat=[trialMat1; trialMat21 trialMat22; trialMat31 trialMat32 trialMat33 trialMat34];

Shuffler=Shuffle(1:length(trialMat));
trialMat=trialMat(:, Shuffler);

strc1step=1; strc1Rev=0; corResp1=0; strc1UD=[]; strc1STEPS=[];
strc2step=8; strc2Rev=0; corResp2=0; strc2UD=[]; strc2STEPS=[];
crash=0; trialSteps=[]; trialNo=0;

%%


while trialNo<length(trialMat)
    trialNo=trialNo+1;
    rndloc=trialMat(1,trialNo);
    if trialMat(2,trialNo)==0 %same
        
        rndloc=trialMat(1,trialNo);
        fprintf('SameLocDot, %d. column.\n', rndloc)
        scndloc=rndloc;
        commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCRandomLocDot\\' num2str(rndloc) '-' num2str(scndloc) '-dot.txt>client.in'];
        system(commm2, '-echo');
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
        spacing=scndloc-rndloc;
        
    else
        
        if trialMat(3,trialNo)==1 %staircase1
            staircase=1;
            if rndloc-strc1step>2
                if rndloc+strc1step>19
                            %left
                    scndloc=rndloc-strc1step;
                else
                    rnd=round(rand(1));
                    if rnd %left
                        scndloc=rndloc-strc1step;
                    else %right
                        scndloc=rndloc+strc1step;
                    end
                end
            else
                %right
                scndloc=rndloc+strc1step;
            end
            
            fprintf('DiffLocDot, %d and %d. column. Staircase %d. \n', rndloc, scndloc, staircase)
                    commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCRandomLocDot\\' num2str(rndloc) '-' num2str(scndloc) '-dot.txt>client.in'];
                    system(commm2, '-echo');
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
                                corResp1=corResp1+1;
                                strc1STEPS=[strc1STEPS strc1step];
                                break
                            elseif keyCode(FalseKey)
                                fprintf('The answer was incorrect. One pixel farther.\n')
                                acc=0;
                                corResp1=0;
                                strc1Steps=[strc1STEPS strc1step];
                                strc1UD=[strc1UD 0];
                                if length(strc1UD)>1
                                    if strc1UD(end)~= strc1UD(end-1)
                                        strc1Rev=strc1Rev+1;
                                        fprintf('strCase1Rev = %d.\n\n', strc1Rev)
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
                    
                    spacing=scndloc-rndloc;
            
            
        elseif trialMat(3,trialNo)==2 %staircase2
            if rndloc-strc2step>2
                if rndloc+strc2step>19 %left
                    scndloc=rndloc-strc2step;
                else
                    rnd=round(rand(1));
                    if rnd %left
                        scndloc=rndloc-strc2step;
                    else %right
                        scndloc=rndloc+strc2step;
                    end
                end
            else %right
                scndloc=rndloc+strc2step; 
            end
            
            staircase=2;
            fprintf('DiffLocDot, %d and %d. column. Staircase %d. \n', rndloc, scndloc, staircase)
                    commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\thresholdtests\\2IFCRandomLocDot\\' num2str(rndloc) '-' num2str(scndloc) '-dot.txt>client.in'];
                    system(commm2, '-echo');
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
                                corResp2=corResp2+1;
                                strc2STEPS=[strc2STEPS strc2step];
                                break
                            elseif keyCode(FalseKey)
                                fprintf('The answer was incorrect. One pixel farther.\n')
                                acc=0;
                                corResp2=0;
                                strc2Steps=[strc2STEPS strc2step];
                                strc2UD=[strc2UD 0];
                                if length(strc2UD)>1
                                    if strc2UD(end)~= strc2UD(end-1)
                                        strc2Rev=strc2Rev+1;
                                        fprintf('strCase2Rev = %d.\n\n', strc2Rev)
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
                    
                    spacing=scndloc-rndloc;
                    
        end
    end
    if crash
        crash=0;
        trialNo=trialNo-1;
        continue
    end
    fprintf(output, '\n%d\t %d\t %d\t %d\t %d\t %d', trialNo, staircase, rndloc, scndloc, acc, spacing);
    
    if acc
        if trialMat(3, trialNo)==1
            if corResp1>2
                if strc1step>1
                    strc1step=strc1step-1;
                    corResp1=0;
                    fprintf('Staircase 1 - One pixel closer\n')
                    if length(strc1UD)>1
                            if strc1UD(end)~= strc1UD(end-1)
                            strCase1Rev=strCase1Rev+1;
                            fprintf('strCase1Rev = %d.\n\n', strCase1Rev)
                            end
                    end
                end
            end
        elseif trialMat(3, trialNo)==2
            if corResp2>2
                if strc2step>1
                    strc2step=strc2step-1;
                    corResp2=0;
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
        if trialMat(3, trialNo)==1
            strc1step=strc1step+1;
        elseif trialMat(3, trialNo)==2
            if strc2step<8
                strc2step=strc2step+1;
            end
        end
        
    end
    
    WaitSecs(.7);
    
end
                

strc1STEPS=[strc1STEPS strc1step];
strc2STEPS=[strc2STEPS strc2step];

a=plot(strc1STEPS);
plot(strc1STEPS)
title([answr{1} '-5th Row 2PD Threshold Staircases'])
xlabel('Order');
ylabel('Spacing');

ylim([0 10])
hold on
a=plot(strc2STEPS);
plot(strc2STEPS)
hold off
saveas(a,[answr{1} '.png']);
fclose(output);
