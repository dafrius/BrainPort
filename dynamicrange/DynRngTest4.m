clear

answr=inputdlg({'Enter Subject ID:'},'ID',[1 18]);

a=datestr(now, 'mm-dd-yyyy HH-MM');
filename2=([answr{1} 'DynRngData' a '.xls']);
output=fopen(filename2,'a');
filename3=([answr{1} 'DynRngResultMat' a '.xls']);


fprintf(output, 'MatLoc\t Stimulation\t Answer\n ');

commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1,'-echo');


%-------------------------Keyboard Keys--------------------------------%
KbName('UnifyKeyNames');
FalseKey=KbName('n'); 
TrueKey=KbName('y');
spaceKey = KbName('space'); 
escKey = KbName('ESCAPE');
nextKey = KbName ('1!');
nextKey2 = KbName ('9(');
fixKey= KbName('f');
quickfixKey=KbName('q');




    locationsinfo=[repmat(1:4,1,1); repmat(128,1,4); zeros(1,4)];
    locs=0;
    resultmat=zeros(2,4);
while locs<4

    randomno=locationsinfo(1,(randi(numel(locationsinfo(1,:)))));
    randomloc=find(locationsinfo(1,:)==randomno);
    if locationsinfo(3,randomloc)==3 || locationsinfo(2,randomloc)>252
        resultmat(1,randomno)=locationsinfo(1,randomloc);
        resultmat(2,randomno)=locationsinfo(2,randomloc);
        locationsinfo(:,randomloc)=[];
        locs=locs+1;
        continue
    elseif locationsinfo(3,randomloc)==0
        locationsinfo(2,randomloc)=locationsinfo(2,randomloc)+10;    
    end
    
    filename=['mat' num2str(randomno) '-' num2str(locationsinfo(2,randomloc)) '.txt'];
    
    
    fprintf('Incoming location and intensity is: %s, %s\n', num2str(locationsinfo(1,randomloc)), num2str(locationsinfo(2,randomloc)));
    fprintf('The subject succeeded in this location & intensity level for %d times.\n', locationsinfo(3,randomloc));
    fprintf('Press the button when ready to start stimulation.\n\n')
    
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
           elseif keyCode(quickfixKey)
                    iodcrash=1;
                    fprintf('IOD client crashed. Enter ''iod-client'' to the cmd screen and \n ask the participant to press start key again.\n');
                    break
           end    
         end
     end
    
    commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\DRStimuli4\' filename '>client.in'];
    system(commm2, '-echo');
    WaitSecs(5);
    system(commm2, '-echo');
    
    fprintf('Could the subject feel it? \n Press Y for yes, N for no.\n\n')
    
    while 1 
         %keyIsDown=0;
         [keyIsDown, keyTime, keyCode]=KbCheck;
         FlushEvents('keyDown');
         if keyIsDown
             if keyCode(TrueKey)
                 fprintf('The answer was saved.\n\n');
                 answer=1;
                 break
             elseif keyCode(FalseKey)
                 fprintf('The stimulation is increased in that location.\n\n');
                 answer=0;
                 break
             elseif keyCode(fixKey)
                    system(commm2, '-echo');
            elseif keyCode(quickfixKey)
                    iodcrash=1;
                    fprintf('IOD client crashed. Enter ''iod-client'' to the cmd screen and \n ask the participant to press start key again.\n');
                    break
             elseif keyCode(escKey)
                return
             end
         end
    end
    

    %WaitSecs(1);
    
    if answer==1
        locationsinfo(3,randomloc)=locationsinfo(3,randomloc)+1;    
    else
        locationsinfo(3,randomloc)=0;
    end
    
    fprintf(output, '%d\t %d\t %d\n ', locationsinfo(1,randomloc), locationsinfo(2,randomloc), answer);

end
fclose(output);
xlswrite(filename3,resultmat);