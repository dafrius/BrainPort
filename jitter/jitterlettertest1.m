clear

answr=inputdlg({'Enter Subject ID:'},'ID',[1 18]);

a=datestr(now, 'mm-dd-yyyy HH-MM');
output=fopen([answr{1} 'JitterLetterData' a '.xls'],'a');

fprintf(output, 'TrialNo\t Condition\t Stimulus\t Response\t Accuracy\t Reaction Time\n');
%%
%Insert info about name of text files
load jitterletterinfo.mat jitterletterinfo
tottrinum=52; %total number of trials
commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1,'-echo');
commm3='echo iod.file: C:\\i686-w64-mingw32\\tmp\\JitterLetters\Q-Static.txt >client.in';

matrix1stcond=Shuffle(1:26);

mymat=[sort(repmat(1:2,1,13)) ; matrix1stcond(1:13), matrix1stcond(14:26)];
mymat2=[sort(repmat(1:2,1,13)) ; matrix1stcond(14:26), matrix1stcond(1:13)];

MatShuff=Shuffle(1:26);
mymat=mymat(:,MatShuff);
MatShuff2=Shuffle(1:26);
mymat2=mymat2(:,MatShuff2);

trialmatrix=[mymat mymat2];

randomizer=randperm(tottrinum);
staticnames=jitterletterinfo.names(1:26);
jitternames=jitterletterinfo.names(27:52);
condition=jitterletterinfo.condition;
trlcntr=1;
accuracy=0;


%% -------------------------Keyboard Keys--------------------------------%
KbName('UnifyKeyNames');
FalseKey=KbName('n'); 
TrueKey=KbName('y');
spaceKey = KbName('space'); 
escKey = KbName('ESCAPE');
nextKey = KbName ('1!');
nextKey2 = KbName ('9(');
fixKey= KbName('f');
testKey= KbName('t');
%%
%%%%%%
fprintf('Please press T key to send a test stimulus for intensity adjustment. \n');


x=0;
while x<2
      [keyIsDown, keyTime, keyCode] = KbCheck;
      FlushEvents('keyDown');      
        if keyIsDown
           if keyCode(testKey)
               system(commm3, '-echo');
               x=x+1;
               if x==1
               fprintf('IOD active\n');
               tStart=GetSecs;
               else
               fprintf('IOD deactive\n');
               rt = 1000.*(GetSecs-tStart);
               end
               WaitSecs(1);
           elseif keyCode(escKey)
              return
           elseif keyCode(fixKey)
              system(commm3, '-echo');
              tStart=GetSecs;
           end    
        end
        %if( (keyTime - tStart) > duration(rnd)/100)
            %timedout = true;
            %after10=true;
        %end
end

answr3=inputdlg({'Subject Intensity Level:'},'Intensity',[1 18]);

%%

%drwngsnd=wavread('chime.wav');
%flatsnd=wavread('cymbals.wav');
%totsnd=wavread('doorbell_x.wav');
for repeat=1:1
    %------------------total num of trials------------------
    %Shuffler=Shuffle(1:tottrinum);
    %names=names(:,Shuffler);
    %condition=condition(:,Shuffler);
for i=1:length(trialmatrix)
    fprintf('Trial Number: %d. \n Condition for the next trial is: \n',trlcntr)
    if trialmatrix(1,i)==1
        fprintf('-------Static\n')
        %sound(drwngsnd);
        filename=staticnames{trialmatrix(2,i)};
    elseif trialmatrix(1,i)==2
        fprintf('-------Jitter\n')
        filename=jitternames{trialmatrix(2,i)};
        %sound(flatsnd);
    end
    
    %filename=names{rnd};
    fprintf('Letter: %s \n--------------Press the key to start.\n', filename(1))
	
    %-------------------------------------------------You should input-----
    %-------------------------------------------------folder name correctly here
    %--------------------------------------------------vvvvvvvvvvvvv----------
    commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\JitterLetters\' filename '>client.in'];
            
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
           elseif keyCode(fixKey)
              system(commm2, '-echo');
           end    
         end
      end
    %%%%%%%%%%
    %fprintf('--------------Stimulation on IOD begins.\n')
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

keyIsDown=0;
timedout=false;
x=0;
while x<2
      [keyIsDown, keyTime, keyCode] = KbCheck;
      FlushEvents('keyDown');      
        if keyIsDown
           if keyCode(nextKey)
               system(commm2, '-echo');
               x=x+1;
               if x==1
               fprintf('IOD active\n');
               tStart=GetSecs;
               else
               fprintf('IOD deactive\n');
               rt = 1000.*(GetSecs-tStart);
               end
               WaitSecs(1);
           elseif keyCode(escKey)
              return
           elseif keyCode(fixKey)
              system(commm2, '-echo');
              tStart=GetSecs;
           end    
        end
        %if( (keyTime - tStart) > duration(rnd)/100)
            %timedout = true;
            %after10=true;
        %end
end
%WaitSecs(1);



%if after10 == true
%fprintf('--------------Stimulation ends.\n')
%else
%fprintf('--------------Stimulation ends.\n Reaction time = %4.2f milliseconds.\n\n', rt)
%end


%if after10==true
%    while 1
%    [keyIsDown, keyTime, keyCode] = KbCheck;
%      FlushEvents('keyDown');      
%        if keyIsDown
%           if keyCode(nextKey2)
%              rt = 1000.*(GetSecs-tStart);
%              fprintf('Reaction time = %4.2f milliseconds.\n\n', rt)
%              break;
%           elseif keyCode(escKey)
%              return
%           end    
%        end
%    end
%end


fprintf('Answer was: %s \n Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n',filename(1))
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
    response=filename(1);
    accuracy=accuracy+1;
end

fprintf(output, '%d\t %d\t %s\t %s\t %d\t %4f\n', trlcntr, trialmatrix(1,i), filename(1:end), response, acc, rt);
trlcntr=trlcntr+1;

Beeper;
end
end
%%
fprintf('End of experiment.\n\n');

fprintf(output, 'Subject Intensity Level: \t %s', num2str(answr3{1}));
%accperc=(accuracy/length(orientation))*100;

%fprintf('\n Training accuracy was: %3.2f%% .\n\n', accperc)

%if accperc <100
%     %fprintf('Please do the training again, until the subject reaches 100%% accuracy.\n\n')
% else
%     fprintf('Excellent! Now the subject can move on to the experimental session.\n\n');
% end

fclose(output);
