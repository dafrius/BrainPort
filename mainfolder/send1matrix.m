
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

commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1,'-echo');
commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\GIMPnumbers\0-Static.txt >client.in'];
while 1 %next/quit
      [keyIsDown, secs, keyCode] = KbCheck;
      FlushEvents('keyDown');
        if keyIsDown
           if keyCode(nextKey)
              system(commm2, '-echo');
              fprintf('sending signal\n');
           elseif keyCode(escKey)
              return
           end    
         end
end

      

