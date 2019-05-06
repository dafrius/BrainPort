clear all;
close all;                    
sca;
pkg load image;

%-------------------------Participant Info-----------------------------%

answr = inputdlg('Enter participant ID', 'Participant ID');

p.PARTID = answr{1};
if isempty(p.PARTID)
    p.PARTID = 'PrtXXX';
end
datetime= sprintf(strftime ("%r %A %e %B %Y", localtime (time ())));
outputname = ['GN' p.PARTID ' ' datetime '.xls' ];
outputname2=['TDGN' p.PARTID ' ' datetime '.mat'];
outputname3=['SDGN' p.PARTID ' ' datetime '.mat'];
outfile = fopen(outputname,'a');


%-------------------------Screen Settings------------------------------%
PsychDefaultSetup(2);
PsychImaging('PrepareConfiguration'); 
PsychImaging('AddTask', 'General', 'FloatingPoint32Bit '); 
screenNumber = max(Screen('Screens'));
Screen('Preference', 'VisualDebugLevel', 3);
Screen('Preference', 'SuppressAllWarnings', 1);
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey = white / 2;
wRect = [0 0 0 0];
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey, [],  32, 2,...
    [], [],  kPsychNeed32BPCFloat);
[xCenter, yCenter] = RectCenter(windowRect);
% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
Screen('Preference', 'SkipSyncTests', 1);
Screen('Flip', window);
% Query the frame duration
ifi = Screen('GetFlipInterval', window);
% Number of frames to wait before re-drawing
waitframes = 1;

%-------------------------Keyboard Keys--------------------------------%
KbName('UnifyKeyNames');
Key1=KbName('LeftArrow'); 
Key2=KbName('RightArrow');
spaceKey = KbName('space'); 
escKey = KbName('ESCAPE');
nextKey = KbName ('s');
nextKey2 = KbName ('t');

%----------------------------------------------------------------------
%                       Timing Information
%----------------------------------------------------------------------
% Stimulus duration time in seconds and frames
p.StimTimeSecs = .1;
p.ISI = .5;
p.FixationSecs = .5;
rand('seed', sum(100 * clock));

%-------------------------Fixation Cross-------------------------------%
xCoords = [-20 20 0 0];
yCoords = [0 0 -20 20];
allCoords = [xCoords; yCoords]; 
%-------------------------Intro Screen---------------------------------%
HideCursor;
Screen('TextSize', window, 24);
DrawFormattedText(window, 'Yaşar Üniversitesi Psikoloji Bölümü laboratuar oturumuna hoşgeldiniz. \n\n Lütfen kullanıyorsanız gözlük ya da lensinizi taktığınızdan emin olunuz\n ve cep telefonunuzun sesini kısınız. \n\n ---Oturum yaklaşık 10 dakika sürecektir.--- \n\n\n Deney hakkında daha fazla bilgi almak için SPACE tuşuna basınız.', 'center', 'center', black);
Screen('Flip',window );
while 1
    [keyIsDown, secs, keyCode] = KbCheck;
    FlushEvents('keyDown');
    if keyIsDown
        if keyCode(spaceKey)
            break;
        end
    end
end
      
Screen('Flip',window );
DrawFormattedText(window, 'Katılmış olduğunuz bu deneyde size çeşitli yüz resimleri sunulacaktır.\n\n Sunulan resimdeki kişi bir kadınsa SOL OK tuşuna, \n\n bir erkekse SAĞ OK tuşuna basmanız beklenmektedir. \n\n\n Her bir denemeyi SPACE tuşuna basarak başlatabilirsiniz. \n\n\n Hazır olduğunuzda kısa bir pratik yapmak için T tuşuna basınız. \n\n KADIN       ERKEK\n<<--       -->>', 'center', 'center', black);
Screen('Flip',window );

%-----------------Stimulus Reading and Randomization-------------------%
imdir=[pwd filesep 'olivahybrids1999'];
[A,B,C]=readImages(imdir,'JPG');
randomizer=randperm(B);
A = A(randomizer);
p.imagenames = C(randomizer);
p.numTrials = B;
p.TrialDataLabel = {'TrialNo' 'HybridType' 'RT' 'SeenResp' 'Sees'};
pracdir=[pwd filesep 'olivahybrids1999' filesep 'pracson'];
[D,E,F]=readImages(pracdir,'JPG');
pracrand=randperm(E);
D=D(pracrand);
p.pracimgnames=F(pracrand);
p.pracTrials=E;
pracCounter=1;
trialCounter=1;
p.allTrials=E+B;
TrialData = cell(p.allTrials, length(p.TrialDataLabel)); 
fprintf(outfile, 'Trial No\t Hybrid Type\t RT\t SeenResponse\t Sees\n' );
p.SummaryDataColumns = {'HappyLSFprop' 'AngryLSFprop' 'HWLSFprop' 'HMLSFprop' 'AWLSFprop' 'AMLSFprop'	'Man'	'Woman' 'TotLSF' 'TotHSF'};
p.SummaryDataRows= {'Number' 'Proportion' 'MeanRT' 'MedianRT'};
SummaryData = zeros(length(p.SummaryDataRows), length(p.SummaryDataColumns));
      % matrix rec is initialized as an nTrials x 5 of NaN
%SummaryData = nan(size(p.GapSizes, 2), p.numPairs, 2);


while 1
    [keyIsDown, secs, keyCode] = KbCheck;
    FlushEvents('keyDown');
    if keyIsDown
        if keyCode(nextKey2)
            break;
        end
    end
end
      
Screen('Flip',window );

%------------------Experimental Loop----------------------------------%

for trialNo = 1:p.allTrials
      if trialNo == 1; %Pause Screens
           Screen('TextSize', window, 24);
            DrawFormattedText(window, '8 denemeden oluşan pratik bloğuna başlamak için \n\n SPACE tuşuna basınız. ',...
            'center', 'center', black);
            WaitSecs(.3);
            Screen('Flip',window);
            while 1
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                 if keyIsDown
                      if keyCode(spaceKey)
                      break;
                      end
                 end
            end
            WaitSecs(.1);
      elseif trialNo == 9
             Screen('TextSize', window, 24);
            DrawFormattedText(window, 'Deneme bitti, hazır olduğunuzda T tuşuna basarak \n\n deneyin ilk bloğuna başlayabilirsiniz. ',...
            'center', 'center', black);
            WaitSecs(.3);
            Screen('Flip',window);
            while 1
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                 if keyIsDown
                      if keyCode(nextKey2)
                      break;
                      end
                 end
            end
      elseif trialNo == 57
            Screen('TextSize', window, 24);
            DrawFormattedText(window, 'İlk blok bitti. Biraz dinlendikten sonra hazır olduğunuzda \n\n T tuşuna basarak ikinci bloğa başlayabilirsiniz. ',...
            'center', 'center', black);
            WaitSecs(.3);
            Screen('Flip',window);
            while 1 %t key
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                 if keyIsDown
                      if keyCode(nextKey2)
                      break;
                      end
                 end
            end
       
           
           Screen('TextSize', window, 24);
            DrawFormattedText(window, '8 denemeden oluşan pratik bloğuna başlamak için \n\n SPACE tuşuna basınız. ',...
            'center', 'center', black);
            WaitSecs(.3);
            Screen('Flip',window);
            while 1
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                 if keyIsDown
                      if keyCode(spaceKey)
                      break;
                      end
                 end
            end
            WaitSecs(.1);
       elseif trialNo == 65
            Screen('TextSize', window, 24);
            DrawFormattedText(window, 'Deneme bitti, hazır olduğunuzda T tuşuna basarak \n\n ikinci bloğa başlayabilirsiniz. ',...
            'center', 'center', black);
            WaitSecs(.3);
            Screen('Flip',window);
            while 1
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                 if keyIsDown
                      if keyCode(nextKey2)
                      break;
                      end
                 end
            end
      
      end
      
      TrialData{trialNo,1}=trialNo;
   
      %stimulus tagging
       if trialNo < 9 || trialNo >56 && trialNo <65
            if p.pracimgnames{pracCounter,1}(1:3) == 'man' && p.pracimgnames{pracCounter,1}(5)== 'N' && p.pracimgnames{pracCounter,1}(7:9) == 'wom' && p.pracimgnames{pracCounter,1}(11)=='A'                  
                    
                    TrialData{trialNo,2}= 'nm_aw'; %hybrid type
                    %wom = 'HSF';
                  
            elseif p.pracimgnames{pracCounter,1}(1:3) == 'man' && p.pracimgnames{pracCounter,1}(5)== 'N' && p.pracimgnames{pracCounter,1}(7:9)=='wom' && p.pracimgnames{pracCounter,1}(11)=='H'              
                    
                    TrialData{trialNo,2}= 'nm_hw';
                    %wom = 'HSF';
                    
            elseif p.pracimgnames{pracCounter,1}(1:3) == 'man' && p.pracimgnames{pracCounter,1}(5)== 'A' && p.pracimgnames{pracCounter,1}(7:9)=='wom' && p.pracimgnames{pracCounter,1}(11)=='N'
                                  
                    TrialData{trialNo,2}= 'am_nw';
                    %wom = 'HSF';
                    
            elseif p.pracimgnames{pracCounter,1}(1:3) == 'man' && p.pracimgnames{pracCounter,1}(5)== 'H' && p.pracimgnames{pracCounter,1}(7:9)=='wom' && p.pracimgnames{pracCounter,1}(11)=='N'
                                  
                    TrialData{trialNo,2}= 'hm_nw';
                    %wom = 'HSF';
                    
            elseif p.pracimgnames{pracCounter,1}(1:3) == 'wom' && p.pracimgnames{pracCounter,1}(5)== 'N' && p.pracimgnames{pracCounter,1}(7:9)=='man' && p.pracimgnames{pracCounter,1}(11)=='A'
                                  
                    TrialData{trialNo,2}= 'nw_am';
                    %wom = 'LSF';
                    
            elseif p.pracimgnames{pracCounter,1}(1:3) == 'wom' && p.pracimgnames{pracCounter,1}(5)== 'N' && p.pracimgnames{pracCounter,1}(7:9)=='man' && p.pracimgnames{pracCounter,1}(11)=='H'
                                   
                    TrialData{trialNo,2}= 'nw_hm';
                    %wom = 'LSF';
                    
            elseif p.pracimgnames{pracCounter,1}(1:3) == 'wom' && p.pracimgnames{pracCounter,1}(5)== 'A' && p.pracimgnames{pracCounter,1}(7:9)=='man' && p.pracimgnames{pracCounter,1}(11)=='N'
                                    
                    TrialData{trialNo,2}= 'aw_nm';
                    %wom = 'LSF';
                    
            elseif p.pracimgnames{pracCounter,1}(1:3) == 'wom' && p.pracimgnames{pracCounter,1}(5)== 'H' && p.pracimgnames{pracCounter,1}(7:9)=='man' && p.pracimgnames{pracCounter,1}(11)=='N'
                                        
                    TrialData{trialNo,2}= 'hw_nm';
                    %wom = 'LSF'; 
            end
        imageTexture = Screen('MakeTexture', window, D{pracCounter,1});                    
        Screen('DrawLines', window, allCoords, 1, black, [xCenter yCenter], 2);
        Screen('Flip', window);
        keyIsDown=0;
        pracCounter=pracCounter+1;
      else
            if p.imagenames{trialCounter,1}(1:3) == 'man' && p.imagenames{trialCounter,1}(5)== 'N' && p.imagenames{trialCounter,1}(7:9) == 'wom' && p.imagenames{trialCounter,1}(11)=='A'                  
                    
                    TrialData{trialNo,2}= 'nm_aw'; %hybrid type
                    %wom = 'HSF';
                  
            elseif p.imagenames{trialCounter,1}(1:3) == 'man' && p.imagenames{trialCounter,1}(5)== 'N' && p.imagenames{trialCounter,1}(7:9)=='wom' && p.imagenames{trialCounter,1}(11)=='H'              
                    
                    TrialData{trialNo,2}= 'nm_hw';
                    %wom = 'HSF';
                    
            elseif p.imagenames{trialCounter,1}(1:3) == 'man' && p.imagenames{trialCounter,1}(5)== 'A' && p.imagenames{trialCounter,1}(7:9)=='wom' && p.imagenames{trialCounter,1}(11)=='N'
                                  
                    TrialData{trialNo,2}= 'am_nw';
                    %wom = 'HSF';
                    
            elseif p.imagenames{trialCounter,1}(1:3) == 'man' && p.imagenames{trialCounter,1}(5)== 'H' && p.imagenames{trialCounter,1}(7:9)=='wom' && p.imagenames{trialCounter,1}(11)=='N'
                                  
                    TrialData{trialNo,2}= 'hm_nw';
                    %wom = 'HSF';
                    
            elseif p.imagenames{trialCounter,1}(1:3) == 'wom' && p.imagenames{trialCounter,1}(5)== 'N' && p.imagenames{trialCounter,1}(7:9)=='man' && p.imagenames{trialCounter,1}(11)=='A'
                                  
                    TrialData{trialNo,2}= 'nw_am';
                    %wom = 'LSF';
                    
            elseif p.imagenames{trialCounter,1}(1:3) == 'wom' && p.imagenames{trialCounter,1}(5)== 'N' && p.imagenames{trialCounter,1}(7:9)=='man' && p.imagenames{trialCounter,1}(11)=='H'
                                   
                    TrialData{trialNo,2}= 'nw_hm';
                    %wom = 'LSF';
                    
            elseif p.imagenames{trialCounter,1}(1:3) == 'wom' && p.imagenames{trialCounter,1}(5)== 'A' && p.imagenames{trialCounter,1}(7:9)=='man' && p.imagenames{trialCounter,1}(11)=='N'
                                    
                    TrialData{trialNo,2}= 'aw_nm';
                    %wom = 'LSF';
                    
            elseif p.imagenames{trialCounter,1}(1:3) == 'wom' && p.imagenames{trialCounter,1}(5)== 'H' && p.imagenames{trialCounter,1}(7:9)=='man' && p.imagenames{trialCounter,1}(11)=='N'
                                        
                    TrialData{trialNo,2}= 'hw_nm';
                    %wom = 'LSF'; 
            end
        imageTexture = Screen('MakeTexture', window, A{trialCounter,1});                    
        Screen('DrawLines', window, allCoords, 1, black, [xCenter yCenter], 2);
        Screen('Flip', window);
        keyIsDown=0;
        trialCounter=trialCounter+1;
      end 
    while 1 %next/quit
   [keyIsDown, secs, keyCode] = KbCheck;
   FlushEvents('keyDown');
        if keyIsDown
           if keyCode(spaceKey)
              break;
           elseif keyCode(escKey)
              save(outputname2, 'p','TrialData');
              fprintf(outfile, 'HappyLSFprop\t AngryLSFprop\t HWLSFprop\t HMLSFprop\t AWLSFprop\t AMLSFprop\t Man\t Woman\t TotLSF \tTotHSF\n');
              fclose(outfile);
              newSumData;
              sca;
              return
           end    
       end
    end
    
         Screen('Flip', window);
         %WaitSecs(0.05);
         %Screen('DrawLines', window, allCoords, 1, black, [xCenter yCenter], 2);
         %Screen('Flip', window);
         WaitSecs(p.ISI);
         Screen('Flip', window);
         WaitSecs(0.1);                                 
         Screen('DrawTexture', window, imageTexture, [], [], 0);
         Screen('Flip', window);
         WaitSecs(0.05);
         Screen('Flip', window);
         %blank screen
         Screen('Flip', window);
         
         
                      %%%RESPONSE%%%
         timeStart = GetSecs;
         keyIsDown=0;
         
         while 1 %Response recording
             [keyIsDown, secs, keyCode] = KbCheck;
             FlushEvents('keyDown');
             if keyIsDown
                 nKeys = sum(keyCode);
                 if nKeys==1
                     if keyCode(Key1)||keyCode(Key2)
                         rt = 1000.*(GetSecs-timeStart);
                         keypressed=find(keyCode);
                         Screen('Flip', window);
                         break;
                     end
                     keyIsDown=0; keyCode=0;
                 end
             end
         end
         
         TrialData{trialNo,3}=rt;
         
  if keyCode(Key1)%left or wom
           Response = 1; %neutral %or %woman         
           seenface = 'wom';
           
    %%%%%%%%%%%%%GENDER%%%%%%%%%%%%%%
           if TrialData{trialNo,2}(2) == 'w';
           sees = 'LSF';
           else
           sees = 'HSF';
           end
    %%%%%%%%%%%%%GENDER%%%%%%%%%%%%%%
    
  elseif keyCode(Key2) %right or man
           Response = 2; %expressive %or %man
           seenface= 'man';  
           
    %%%%%%%%%%%%%GENDER%%%%%%%%%%%%%%       
           if TrialData{trialNo,2}(2) == 'm';
           sees = 'LSF';
           else
           sees = 'HSF';
           end
    %%%%%%%%%%%%%GENDER%%%%%%%%%%%%%%
    
  end
         
           Screen('Flip', window);
         hybridtype=TrialData{trialNo,2};
         TrialData{trialNo,4}=seenface;
         TrialData{trialNo,5}=sees;
           
         fprintf(outfile, '%d\t %s\t %4f\t %s\t %s\n', trialNo, hybridtype, rt, seenface, sees);
         %end
end
%--------------------------Ending Screen--------------------------%
Screen('TextSize', window, 24);
            DrawFormattedText(window, 'Deney sona erdi.\n\n Katılımınız için teşekkür ederiz. ',...
            'center', 'center', black);
            WaitSecs(.3);
            Screen('Flip',window);
            while 1
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                 if keyIsDown
                      if keyCode(spaceKey)
                      break;
                      end
                 end
            end
%-----------------------Save & Exit-------------------------------%
trialNo=trialNo+1; 
save(outputname2, 'p','TrialData', 'outputname', 'outputname2', 'outputname3');
fprintf(outfile, 'HappyLSFprop\t AngryLSFprop\t HWLSFprop\t HMLSFprop\t AWLSFprop\t AMLSFprop\t Man\t Woman\t TotLSF \tTotHSF\n');
fclose(outfile);
newSumData;
sca;