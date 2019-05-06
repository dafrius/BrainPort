function [Key,rt]=KeyResponse(varargin)

timeStart = GetSecs;
 while 1
             [keyIsDown,secs,keyCode] = KbCheck;
             NKey= KbName(varargin);
              if keyIsDown || secs>10
                  nKeys = sum(keyCode);
                  if nKeys==1 
                      if ismember(find(keyCode==1),NKey)
                          rt = 1000.*(GetSecs-timeStart);
                          Key=KbName(find(keyCode==1));
                          break;
                      else
                          keyIsDown=0; keyCode=0;
                          
                      end
                     
                   end
              end
              
 end
           






