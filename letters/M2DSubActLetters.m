clear

answr=inputdlg({'Enter Subject ID:'},'ID',[1 18]);

a=datestr(now, 'mm-dd-yyyy HH-MM');
output=fopen([answr{1} ' ' a '.xls'],'a');

fprintf(output, 'TrialNo\t Condition\t Letter\t Response\t Accuracy\t Repetition\n');



%----------------------Stimulus/Order Preparation-------------------------%
load alllettersinfo2.mat alllettersinfo

commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1,'-echo');

randomizer=randperm(78);
names=alllettersinfo.names;
duration=alllettersinfo.duration;
condition=alllettersinfo.condition;

anscntr=1;
trlcntr=1;

Shuffler=Shuffle(1:26);
blck11=repmat(1,1,9); %9*drawing
blck11=[blck11 repmat(2,1,9)]; %9*flat
blck11=[blck11 repmat(3,1,8)]; %8*tracing
blck12=sort(repmat(1:26,1,1));
blck1=[blck11; blck12];
blck1=blck1(:,Shuffler);

Shuffler=Shuffle(1:26);
blck21=repmat(2,1,9); %8*flat
blck21=[blck21 repmat(3,1,9)]; %9*tracing
blck21=[blck21 repmat(1,1,8)]; %9*drawing
blck22=sort(repmat(1:26,1,1));
blck2=[blck21; blck22];
blck2=blck2(:,Shuffler);

Shuffler=Shuffle(1:26);
blck31=repmat(3,1,9); %9*tracing
blck31=[blck31 repmat(1,1,9)]; %8*drawing
blck31=[blck31 repmat(2,1,8)]; %9*flat
blck32=sort(repmat(1:26,1,1));
blck3=[blck31; blck32];
blck3=blck3(:,Shuffler);

allblcks=[blck1 blck2 blck3];
%-------------------------------------------------------------------------%
%-------------------------Keyboard Keys-----------------------------------%
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

%-------------------------------------------------------------------------%
%%%%%%

drwngsnd=audioread('drawing.wav');
flatsnd=audioread('static.wav');
totsnd=audioread('tracing.wav');
Fs=50000;
%------------------------------Trial Loop---------------------------------%
for i=1:length(alllettersinfo.letter)
 while anscntr==i
    iodcrash=0;
    rts=[];
    fprintf('Trial Number: %d. \n Condition for the next trial is: \n',trlcntr)
    if allblcks(1,i)==1
        fprintf('-------DRAWING\n')
        filename=names{allblcks(2,i)};
        dura=duration(allblcks(2,i));
        sound(drwngsnd,Fs);
    elseif allblcks(1,i)==2
        fprintf('-------STATIC-FLAT\n')
        filename=names{allblcks(2,i)+26};
        dura=duration(allblcks(2,i)+26);
        sound(flatsnd,Fs);
    elseif allblcks(1,i)==3
        fprintf('-------STATIC-TIP OF THE TONGUE\n')
        filename=names{allblcks(2,i)+52};
        dura=duration(allblcks(2,i)+52);
        sound(totsnd,Fs);
    end
    WaitSecs(.5);
    fprintf('--------------Press the key to start the first repetition.\n')
	
    
    %filename=names{rnd};
    commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\NewGIMPDrawings\' filename '>client.in'];
    %%%%%%%%%%%%%%%%%
      %trialNo=trialNo+1;
      
      
repetition=0;
while repetition<3
    resp=0;
    %-----------------------Stimulus Onset Signal-------------------------%
    if iodcrash==1
        iodcrash=0;
    else
        repetition=repetition+1;
    end
    
      while 1 %next/quit
      [keyIsDown, secs, keyCode] = KbCheck;
      FlushEvents('keyDown');
        if keyIsDown
           if keyCode(nextKey)
              break;
           elseif keyCode(fixKey)
               system(commm2, '-echo');
           elseif keyCode(quickfixKey)
               fprintf('IOD client crashed. Enter ''iod-client'' to the cmd screen and \n ask the participant to press start key again. \n');
               iodcrash=1;
               break
           elseif keyCode(quickansKey)
               resp=1;
               break
           elseif keyCode(escKey)
              return
           end    
         end
      end
    WaitSecs(.5);
    if iodcrash==1
        continue
    end

    if resp ~= 1
    WaitSecs(.5);
    fprintf('--------------Stimulation on IOD begins.\n')
    system(commm2, '-echo');
    %---------------------------------------------------------------------%
    WaitSecs(dura/1000);
    system(commm2, '-echo');
    Beeper;
    fprintf('--------------Repetition %d completed. Stimulation ends.\n',repetition)
    fprintf('--------------Press the start key again to start another repetition.\n')
    end
        

end

fprintf('The answer was, %s. Did the subject answer correctly? \n Press Y for correct, N for incorrect.\n\n', filename(1))
     while 1 
         %keyIsDown=0;
         [keyIsDown, keyTime, keyCode]=KbCheck;
         FlushEvents('keyDown');
         if keyIsDown
             if keyCode(TrueKey)
                 fprintf('The answer was correct.\n\n')
                 acc=1;
                 out=1;
                 break
             elseif keyCode(FalseKey)
                 fprintf('The answer was incorrect.\n\n')
                 acc=0;
                 out=1;
                 break
             elseif keyCode(fixKey)
               system(commm2, '-echo');
             elseif keyCode(quickfixKey)
               fprintf('IOD client crashed. Enter ''iod-client'' to the cmd screen and \n ask the participant to press start key again. \n');
               iodcrash=1;
               break
             end
         end
     end
     if resp == 1
     repetition=repetition-1;
     end
if acc == 0
    answr2=inputdlg({'What was subject''s response?'},'Response',[1 18]);
    response=answr2{1};
else
    response=filename(1);
end

fprintf(output, '%d\t %d\t %s\t %s\t %d\t %d\n', trlcntr, allblcks(1,i), filename(1), response, acc, repetition);
trlcntr=trlcntr+1;
Beeper;
WaitSecs(10);
if out == 1
    anscntr=anscntr+1;
end
end
end
fclose(output);
