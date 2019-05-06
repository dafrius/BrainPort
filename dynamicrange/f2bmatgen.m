f2bmat=zeros(20,20);

a=14;
for j=1:8:17
    for i=1:3:17
    f2bmat(i:i+2,j:j+3)=255/14*a;
    a=a-1;
    f2bmatshow=f2bmat/255;
    imshow(f2bmatshow);
    f2bmat(19:20,j:j+3)=255/14*a;
    end
    
    mtrxfile=fopen(['f2bmat' num2str(j) '-' num2str(14) '.txt'],'w');
    fwrite(mtrxfile, transpose(f2bmat));
    fclose(mtrxfile);
    f2bnor=zeros(20,20);
    f2bnor(:,j:j+3)=256;
    mtrxfile2=fopen(['f2bnor' num2str(j) '.txt'],'w');
    fwrite(mtrxfile2, transpose(f2bnor));
    fclose(mtrxfile2);
    a=14;
    %f2bmat=zeros(20,20);
end
