answr=inputdlg({'Enter Subject ID:'},'ID',[1 18]);

%a=datestr(now, 'mm-dd-yyyy HH-MM');
output=[answr{1} 'matrix.xls'];


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

blck4=repmat(1:78,1,1);
allblcks=[blck1 blck2 blck3; blck4];

xlswrite(output, transpose(allblcks))