clear all

answr=inputdlg({'Enter Subject ID:'},'ID',[1 18]);

a=datestr(now, 'mm-dd-yyyy HH-MM');
output=fopen([answr{1} 'TrainingData' a '.xls'],'a');

fprintf(output, 'TrialNo\t Condition\t Letter\t Response\t Accuracy\t Reaction Time\n');

load allbarsinfo.mat allbarsinfo

commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1,'-echo');

randomizer=randperm(12);
names=allbarsinfo.names;
duration=allbarsinfo.duration;
condition=allbarsinfo.condition;

trlcntr=1;
accuracy=0;


%-------------------------Keyboard Keys--------------------------------%
KbName('UnifyKeyNames');
FalseKey=KbName('n'); 
TrueKey=KbName('y');
spaceKey = KbName('space'); 
escKey = KbName('ESCAPE');
nextKey = KbName ('1!');
nextKey2 = KbName ('9(');
fixKey= KbName('f');


%%%%%%

%drwngsnd=wavread('chime.wav');
%flatsnd=wavread('cymbals.wav');
%totsnd=wavread('doorbell_x.wav');

for i=1:length(allbarsinfo.ori)
    rnd=randomizer(i);
    fprintf('Trial Number: %d. \n Condition for the next trial is: \n',trlcntr)
    if condition(rnd)==1
        fprintf('-------DRAWING\n')
        %sound(drwngsnd);
    elseif condition(rnd)==2
        fprintf('-------STATIC-FLAT\n')
        %sound(flatsnd);
    elseif condition(rnd)==3
        fprintf('-------STATIC-TIP OF THE TONGUE\n')
        %sound(totsnd);
    end
    fprintf('--------------Press the key to start.\n')
	
    
    filename=names{rnd};
            
    %%%%%%%%%%%%%%%%%
      %trialNo=trialNo+1;
      while 1 %next/quit
      [keyIsDown, secs, keyCode] = KbCheck;
      FlushEvents('keyDown');
        if keyIsDown
           if keyCode(nextKey)
              break;
           elseif keyCode(escKey)
              return
           end    
         end
      end
    %%%%%%%%%%
    fprintf('--------------Stimulation on IOD begins.\n')
    
commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\TrainingStimuli\' filename '>client.in'];
system(commm2, '-echo');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tStart = GetSecs;
keyIsDown=0;
timedout=false;
while ~timedout
      [keyIsDown, keyTime, keyCode] = KbCheck;
      FlushEvents('keyDown');      
        if keyIsDown
           if keyCode(nextKey2)
              rt = 1000.*(GetSecs-tStart);
              after10=false;
              break;
           elseif keyCode(escKey)
              return
           elseif keyCode(fixKey)
              system(commm2, '-echo');
           end    
        end
        if( (keyTime - tStart) > duration(rnd)/100)
            timedout = true;
            after10=true;
        end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

system(commm2, '-echo');
if after10 == true
fprintf('--------------Stimulation ends.\n')
else
fprintf('--------------Stimulation ends.\n Reaction time = %4.2f milliseconds.\n\n', rt)
end


if after10==true
    while 1
    [keyIsDown, keyTime, keyCode] = KbCheck;
      FlushEvents('keyDown');      
        if keyIsDown
           if keyCode(nextKey2)
              rt = 1000.*(GetSecs-tStart);
              fprintf('Reaction time = %4.2f milliseconds.\n\n', rt)
              break;
           elseif keyCode(escKey)
              return
           end    
        end
    end
end


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
                 fprintf('The answer was incorrect.\n\n')
                 acc=0;
                 break
             end
         end
     end
     
if acc ==0
    answr2=inputdlg({'What was subject''s response?'},'Response',[1 18]);
    response=answr2{1};
else
    response=filename(1:3);
    accuracy=accuracy+1;
end

fprintf(output, '%d\t %d\t %s\t %s\t %d\t %4.2f\n', trlcntr, condition(rnd), filename(1:3), response, acc, rt);
trlcntr=trlcntr+1;

Beeper;
end
accperc=(accuracy/length(allbarsinfo.ori))*100;

fprintf('\n Training accuracy was: %3.2f%% .\n\n', accperc)

if accperc <100
    fprintf('Please do the training again, until the subject reaches 100%% accuracy.\n\n')
else
    fprintf('Excellent! Now the subj9ect can move on to the experimental session.\n\n');
end

fclose(output);
