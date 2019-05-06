answr=inputdlg({'Enter Subject ID:'},'ID',[1 18]);

%a=datestr(now, 'mm-dd-yyyy HH-MM');
output=[answr{1} 'matrix.xls'];


Shuffler=Shuffle(1:26);
blck11=repmat(1,1,13); %13*drawing
blck11=[blck11 repmat(2,1,13)]; %13*flat
blck12=sort(repmat(1:26,1,1));
blck1=[blck11; blck12];
blck1=blck1(:,Shuffler);

Shuffler=Shuffle(1:26);
blck21=repmat(2,1,13); %13*flat
blck21=[blck21 repmat(1,1,13)]; %13*drawing
blck22=sort(repmat(1:26,1,1));
blck2=[blck21; blck22];
blck2=blck2(:,Shuffler);


blck4=repmat(1:52,1,1);
allblcks=[blck1 blck2; blck4];

xlswrite(output, transpose(allblcks))