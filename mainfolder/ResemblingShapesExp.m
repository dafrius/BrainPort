clear

%answr=inputdlg({'Enter Subject ID:'},'ID',[1 18]);

a=datestr(now, 'mm-dd-yyyy HH-MM');
output=fopen('NewExpData.xls','a');

fprintf(output, 'TrialNo\t Condition\t Stimulus\t Response\t Accuracy\t Reaction Time\n');
%%
load allnames.mat
mat1=sort(repmat(0:1,1,7));
mat2=repmat(2,1,14);
condmat=[mat1 mat2];
fileno1=repmat(1:7,1,2);
fileno2=repmat(1:14,1,1);
fileno=[fileno1 fileno2];

trialMat1=[condmat; fileno];
Shuffler=Shuffle(1:length(trialMat1));
trialMat1=trialMat1(:,Shuffler);
Shuffler=Shuffle(1:length(trialMat1));
trialMat2=trialmat1(:,Shuffler);
trialMat=[trialMat1 trialMat2];

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
% fprintf('Please press T key to send a test stimulus for intensity adjustment. \n');
% 
% 
% x=0;
% while x<2
%       [keyIsDown, keyTime, keyCode] = KbCheck;
%       FlushEvents('keyDown');      
%         if keyIsDown
%            if keyCode(testKey)
%                system(commm3, '-echo');
%                x=x+1;
%                if x==1
%                fprintf('IOD active\n');
%                tStart=GetSecs;
%                else
%                fprintf('IOD deactive\n');
%                rt = 1000.*(GetSecs-tStart);
%                end
%                WaitSecs(1);
%            elseif keyCode(escKey)
%               return
%            elseif keyCode(fixKey)
%               system(commm3, '-echo');
%               tStart=GetSecs;
%            end    
%         end
%         if( (keyTime - tStart) > duration(rnd)/100)
%             timedout = true;
%             after10=true;
%         end
% end

%answr3=inputdlg({'Subject Intensity Level:'},'Intensity',[1 18]);

%%

%drwngsnd=wavread('chime.wav');
%flatsnd=wavread('cymbals.wav');
%totsnd=wavread('doorbell_x.wav');
trlcntr=0;
accuracy=0;

    %------------------total num of trials------------------
    %Shuffler=Shuffle(1:tottrinum);
    %names=names(:,Shuffler);
    %condition=condition(:,Shuffler);
for i=1:length(trialMat)
    
    fprintf('Trial Number: %d. \n Condition for the next trial is: \n',trlcntr)
    if trialMat(1,i)==0
        fprintf('-------Letter\n')
        %sound(drwngsnd);
        filename=letternames{trialMat(2,i)};
        commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\NewExp\\Letters\' filename '>client.in'];
        fprintf('Stimulus: %s \n--------------Press the key to start.\n', filename)
    elseif trialMat(1,i)==1
        fprintf('-------Number\n')
        filename=numbernames{trialMat(2,i)};
        commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\NewExp\\Numbers\' filename '>client.in'];
        fprintf('Stimulus: %s \n--------------Press the key to start.\n', filename)
        %sound(flatsnd);
    elseif trialMat(1,i)==2
        fprintf('-------Either\n')
        filename=bothnames{trialMat(2,i)};
        commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\NewExp\\Both\' filename '>client.in'];
        fprintf('Stimulus: %s \n--------------Press the key to start.\n', filename)
    end
    
    %filename=names{rnd};
    
	
    %-------------------------------------------------You should input-----
    %-------------------------------------------------folder name correctly here
    %--------------------------------------------------vvvvvvvvvvvvv----------

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

fprintf(output, '%d\t %d\t %s\t %s\t %d\t %4f\n', i, trialMat(1,i), filename(1:end), response, acc, rt);


Beeper;
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
