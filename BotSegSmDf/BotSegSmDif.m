
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BOTTOM SEGMENTS SAME-DIFFERENT TASK WITH LETTERS
%M.U.Canoluk - 2018-2019
%Schepens Eye Research Institute - Peli Lab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% IMPORTANT NOTE !!! THE .M FILE FOR THIS SCRIPT SHOULD BE IN THE TMP
% FOLDER. OTHERWISE THE "system(x)" COMMAND THAT CALLS A COMMAND PROMPT
% WON'T WORK PROPERLY AND THE SCRIPT WON'T HAVE ACCESS TO THE DEVICE. 
% MOVE THIS FOLDER TO THE TMP FILE BEFORE RUNNING IT AND ENTER THE PATHS
% THROUGHOUT THE CODE CORRECTLY.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Steps to follow to conduct this experiment:
%1) Back-Front Intensity Test using IntensityTest.m 

% Details inside the .m file. Have the subject adjust HARDWARE intensity to
% a level that is ROBUST and COMFORTABLE for both front and back. Try to
% make sure perceived intensity is the same for front and back.
% The best way to do this is to have them adjust the back first and make
% ask them to adjust the front to give the same amount of stimulation.
%
% Record the intensity levels for back and % front. You will need them in the next step.
%

%%
%2) Open gradLetterGenerator.m in DrawingCodes folder.

% This file generates 26 letter stimuli for each individual subject by taking
% their back and front sensitivity levels. 
% Enter backsens & frontsens info into gradLetterGenerator.m

% If you want to create the drawing letters in different framerate/speed, you should increase
% framerate to get slower, decrease to get faster. Our preferred framerate
% is 15. Device can process about 30 frames per second. We want them to
% have every segment for about half a second.
%
% 
%%
%3) It will generate all the letters inside the same folder.
% Copy generated files into a new folder named: "ID-FR*(framenumber)-frontsens-backsens"
% Example: "UC777-FR15-60-100"

%%
%4) Run gradrandommatrix.m, enter ID
% Example: UC777
% This creates a newly randomized matrix for the new subject. You should
% create new matrices for each individual so that no two subject have it in
% the same order. Before you run this, I recommend running the "Shuffle"
% command several times. Because matlab has a pre-defined shuffle order and it
% gives you the same random numbers with every new instance of matlab you
% open. If you do this a couple times, it will make sure that it doesn't
% start from the same order.
% 
% This script will create a matrix called IDmatrix, or
% Example:UC777matrix
%%

%5) Run m2dGradualLetters.m (standard)
%   or m2dGradualLetters4frame.m or
%   m2dGradualLetters8frame.m depending on what framerate you want to
%   conduct the experiment with. 
%   Enter the FOLDER NAME for the first input.
%   Example: "UC777-FR15-60-100"
%   Enter the MATRIX NAME as IDmatrix for the second input.
%   Example:UC777matrix

%   In case of a crash or an adverse event, you can start back from the
%   trial number you left off. If it's the first time, just enter 1 for
%   "Starting from trial number:" input dialog.
 
% 
%%%%%%%%%%%%%%%%%%%%%%%%
% There are only static and drawing conditions in this experiment because intensity is
% not constant.
%%%%%%%%%%%%%%%%%%%%%%%%
 
%%

clear
%% This part takes input from the experimenter. 

%Defining which folder to pull
%out the letter stimuli, which matrix to pull out the presentation order,
%and which trial to start the experiment from. 
%It then creates an XLS file with the same name as folder name to record the responses.

answr=inputdlg({'Enter Subject ID'},'ID',[1 45]);

answr3=inputdlg({'Starting from trial number:'},'TN',[1 18]);
output=fopen([answr{1} 'data.xls'],'a');

%% Enter variable names to the top row of the XLS file
fprintf(output, 'TrialNo\t First\t Second\t Accuracy\t Repetition\t Condition\t Stim1\t Stim2\t RT\n');

%% ----------------------Stimulus/Order Preparation-------------------------%
% Load the struct variable into workspace.
% This variable has various information about the letters, their lengths,
% duration, length*duration, file names, and condition. The most important
% ones are names, duration and condition, which are going to be used in
% this experiment.

% I just saved them for new variables named: names, duration and condition,
% for convenience

load([answr{1} 'matrix.mat'])
TIME1=1; %stimulus presentation time in Seconds.
TIME2=2; %interstimulus interval in Seconds.
ANS='ans';

%duration=gradlettersinfo.duration;
%condition=gradlettersinfo.condition;

%% This part pulls out the matrix we created, from our second input (matrix), and makes it our main experimental matrix.

%allblcks=transpose(xlsread([answr2{1} '.xls']));

%% This is to define which trial number we will start from
% takes the input from 3rd input dialog, and defines the anscntr(answer
% counter) and trlcntr(trial counter)
anscntr=str2num(answr3{1});
trlcntr=str2num(answr3{1});

%% Set up Command Prompt directory
commm1='cd C:\i686-w64-mingw32\tmp';
system(commm1,'-echo');


%% Defining Keyboard Keys to be used
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

%% Defining sound files to be used
%%%%%%

%drwngsnd=audioread('drawing.wav');
%flatsnd=audioread('static.wav');
%totsnd=audioread('tracing.wav');
%Fs=50000;



%% ------------------------------Trial Loop---------------------------------%


for i=trlcntr:length(triMatRND) %Start from the trial number entered.
    
    while anscntr==i 
        % We use another variable named "anscntr" here, which adds up 
        % with every recorded answer. This is makes sure there are no
        % trials without a response.
        % 
        iodcrash=0; 
        % We define the crash as 0. When we answer "Yes" to the prompt "Did
        % the client crash?" This becomes 1, and comes back to the
        % beginning of this while loop.
        
        fprintf('Trial Number: %d. \n Condition for the next trial is: \n',trlcntr)
        
        %  This part gathers the filename and duration from the variables
        %  for the current trial, and defines which file will be sent to
        %  the IOD, for how long.
        if triMatRND{3,i}==0
            fprintf('-------SAME\n')
            cond=1;
            if triMatRND{4,i}==1
                fprintf('-------ONESEG\n');
                stim1=1;
                stim2=1;
            elseif triMatRND{4,i}==2
                fprintf('-------TWOSEG\n');
                stim1=2;
                stim2=2;
            elseif triMatRND{4,i}==3
                fprintf('-------HORISEG\n');
                stim1=3;
                stim2=3;
            end
                
        else 
            fprintf('-------DIFFERENT\n')
            cond=0;
            if triMatRND{4,i}==1
                fprintf('-------ONESEG\n');
                stim1=1;
            elseif triMatRND{4,i}==2
                fprintf('-------TWOSEG\n');
                stim1=2;
            elseif triMatRND{4,i}==3
                fprintf('-------HORISEG\n');
                stim1=3;
            end
                        
                
            if triMatRND{3,i}==1
                fprintf('-------ONESEG\n');
                stim2=1;
            elseif triMatRND{3,i}==2
                fprintf('-------TWOSEG\n');
                stim2=2;
            elseif triMatRND{3,i}==3
                fprintf('-------HORISEG\n');
                stim2=3;
            end
            
        end
        
        WaitSecs(.5);
        fprintf('--------------Press 1 or Gamepad A to start the first repetition.\n')
        
        
        
        %% You should enter the correct folder path for the FOLDER NAME that includes FOLDERS with individually created stimuli
        % below.  THE STIMULUS ISN'T PRESENTED YET.
        
        filename1=triMatRND{1,i};
        commm2=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\staticletters\' filename1 '>client.in'];
        
        filename2=triMatRND{2,i};
        commm3=['echo iod.file: C:\\i686-w64-mingw32\\tmp\\staticletters\' filename2 '>client.in'];
        
        
        
        %% 
        repetition=0;
        
        while repetition<1 % This makes sure subject sees it for 3 times.
            resp=0; %resp = 1 if a subject gives a response before completing 3 trials.
            % if resp is equal to 1, steps out of this while loop and goes to collect response. 
            
            %-----------------------Stimulus Onset Signal-------------------------%
            if iodcrash==1
                iodcrash=0;
            else
                repetition=repetition+1;
            end
             % repetition + 1 if it did not crash.
             
            % This part is where it waits for participant's start signal by pressing gamepad key.            
            
            while 1 %next/quit
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                     if keyCode(nextKey)  % If they pressed nextKey, which is "1" or gamepad left shoulder key, it moves to line 253.
                         break;
                     elseif keyCode(fixKey) % If the stimulus did not start, or if the client crashed, 
                                           % Experimenter can press
                                           % fixKey(F) to restart the trial
                                           % with corresponding duration
                                           % and the same letter.
                        repetition=repetition-1;
                        system(commm2, '-echo'); % This is the part where we send the signal to the command prompt.
                        WaitSecs(TIME1); % Wait for duration -0.3, -0.3 was to get a precise time.
                        system(commm2, '-echo'); % This is the part where we send the signal again to remove it from the IOD.
                        
                        WaitSecs(TIME2);
                        
                        system(commm3, '-echo');
                        WaitSecs(TIME1);
                        system(commm3, '-echo');
                        
                        %fprintf('--------------Repetition %d completed. Stimulation ends.\n',repetition)
                        %fprintf('--------------Press the start key again to start another repetition.\n')
                        repetition=repetition+1; %Repetition is increased after a successful trial.
                    elseif keyCode(quickfixKey)
                        system(commm2, '-echo'); 
                                           % If the stimulus did not leave
                                           % the screen, you can press "Q"
                                           % key to send the signal again.
%                     elseif keyCode(quickansKey)
%                         resp=1;
%                                            % If the participant wanted to
%                                            % give a response before 3
%                                            % trials, you can press P key,
%                                            % which ends the trial and moves
%                                            % to the response collection
%                                            % part.
%                         break
                    elseif keyCode(escKey)
                        fclose(output);
                        return
                                           % Press ESCAPE key to stop the
                                           % running experiment
                    end
                end
            end
            
            WaitSecs(.5);
            if iodcrash==1
                continue % If it crashes, continue to the next iteration without reading the rest of the current iteration.
            end
            
            if resp ~= 1 %If the subject did not give an early answer, or if it didn't crash in the previous one, you start the trial.
                WaitSecs(.5);
                fprintf('--------------Stimulation on IOD begins.\n')
                        
                        system(commm2, '-echo'); % This is the part where we send the signal to the command prompt.
                        WaitSecs(TIME1); % Wait for duration -0.3, -0.3 was to get a precise time.
                        system(commm2, '-echo'); % This is the part where we send the signal again to remove it from the IOD.
                        
                        WaitSecs(TIME2);
                        
                        system(commm3, '-echo');
                        WaitSecs(TIME1);
                        system(commm3, '-echo');                
                
                
                %Beeper;
                %fprintf('--------------Repetition %d completed. Stimulation ends.\n',repetition)
                %fprintf('--------------Press the start key again to start another repetition.\n')
            end
        end
        
%         fprintf('--------------Did the client crash?\n')
%         while 1
%             keyIsDown=0;
%             [keyIsDown, keyTime, keyCode]=KbCheck;
%             FlushEvents('keyDown');
%             if keyIsDown
%                 if keyCode(fixKey)
%                     fprintf('Sending signal again.\n\n')
%                         system(commm2, '-echo'); % This is the part where we send the signal to the command prompt.
%                         WaitSecs(TIME1); 
%                         system(commm2, '-echo'); % This is the part where we send the signal again to remove it from the IOD.
%                         
%                         WaitSecs(TIME2)
%                         
%                         system(commm3, '-echo');
%                         WaitSecs(TIME1);
%                         system(commm3, '-echo');
%                     fprintf('--------------Repetition %d completed. Stimulation ends.\n',repetition)
%                     break
%                 elseif keyCode(quickfixKey)
%                     system(commm2, '-echo');
%                 elseif keyCode(spaceKey)
%                     fprintf('No crashes.\n\n')
%                     WaitSecs(1);
%                     break
%                 end
%             end
%         end
        
        
        fprintf('Press Y for SAME, N for DIFFERENT responses.\n\nPress F on Keyboard or X on GamePad if the client crashed and the trial needs to be restarted.\n\nPress Q if the stimulus is stuck on the screen to take it off.\n')
        tStart=GetSecs;
    
        while 1
            
            %keyIsDown=0;
            [keyIsDown, keyTime, keyCode]=KbCheck;
            FlushEvents('keyDown');
            if keyIsDown
                if keyCode(TrueKey)
                    rt = 1000.*(GetSecs-tStart);
                    fprintf('SAME.\n\n')
                    response=1;
                    out=1;
                    break
                elseif keyCode(FalseKey)
                    rt = 1000.*(GetSecs-tStart);
                    fprintf('DIFFERENT.\n\n')
                    response=0;
                    out=1;
                    break
                elseif keyCode(fixKey)
                    
                    fprintf('Sending signal again.\n\n')
                    system(commm2, '-echo'); % This is the part where we send the signal to the command prompt.
                    WaitSecs(TIME1); 
                    system(commm2, '-echo'); % This is the part where we send the signal again to remove it from the IOD.
                        
                    WaitSecs(TIME2);
                        
                    system(commm3, '-echo');
                    WaitSecs(TIME1);
                    system(commm3, '-echo');
                    keyIsDown=0;
                    fprintf('Press Y for SAME, N for DIFFERENT responses.\n\n');
                    tStart=GetSecs;
                    iodcrash=1;
                elseif keyCode(quickfixKey)
                    system(commm3, '-echo');
                    %iodcrash=1;
                    break
                end
            end
        end
        
        
        if iodcrash==1
        
            while 1
                
                %keyIsDown=0;
                [keyIsDown, keyTime, keyCode]=KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    if keyCode(TrueKey)
                        rt = 1000.*(GetSecs-tStart);
                        fprintf('SAME.\n\n')
                        response=1;
                        out=1;
                        break
                    elseif keyCode(FalseKey)
                        rt = 1000.*(GetSecs-tStart);
                        fprintf('DIFFERENT.\n\n')
                        response=0;
                        out=1;
                        break
                    elseif keyCode(quickfixKey)
                        system(commm3, '-echo');
                    end
                end
            end
        end
        
 
        if (response == 1 && triMatRND{3,i}==0) || (response == 0 && triMatRND{3,i}==1 || triMatRND{3,i}==2 || triMatRND{3,i}==3)
            acc=1;
        else
            acc=0;
        end
            
            
        if resp == 1
            repetition=repetition-1;
        end
        
%         answr2=inputdlg({'What was subject''s response?'},'Response',[1 18]);
%         if acc == 0
%             response=answr2{1};
%         else
%             response=filename(1);
%         end
%         
        %This is where we enter the data from this trial into our XLS output file.
        %variables trlcntr, allblcks(1,i), filename(1), response,acc,
        %repetition are all entered in different columns.
        fprintf(output, '%d\t %s\t %s\t %d\t %d\t %d\t %d\t %d\t %4f\n', trlcntr, triMatRND{1,i}, triMatRND{2,i}, acc, repetition, cond, stim1, stim2, rt);
        
        
        trlcntr=trlcntr+1;
        Beeper;
        %WaitSecs(5);
        if out == 1 %out is 1 when an answer is given. if an answer is given, anscntr increases by 1.
            anscntr=anscntr+1;
        end
    end
end

% we close the output file
fclose(output);
