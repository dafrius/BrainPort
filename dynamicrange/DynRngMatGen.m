%matrixgenerator: matrix numbers start from 1 on the top right and end at
%16 in the bottom left. looks like this:

% 1  2  3  4
% 5  6  7  8
% 9 10 11 12
%13 14 15 16

mat1=zeros(20,20);
mat2=zeros(20,20);
mat1(1:20,1:20)=128;
mat2(1:20,1:20)=128;
mtrxfile=fopen(['mat0.txt'],'w');
fwrite(mtrxfile, transpose(mat1));
fclose(mtrxfile);

matno=1;
for matx=1:5:16
    for maty=1:5:16
        for i=1:26
            mat1(matx:matx+4,maty:maty+4)=mat1(matx:matx+4,maty:maty+4)+5;
            mat1show=mat1/255;
            imshow(mat1show);
            inc=128+(i*5);
            mtrxfile=fopen(['mat' num2str(matno) '-' num2str(inc) '.txt'],'w');
            for reps=1:10
                fwrite(mtrxfile, transpose(mat2));
            end
            for reps=1:10
                fwrite(mtrxfile, transpose(mat1));
            end
            fclose(mtrxfile);
        end
        mat1(1:20,1:20)=128;
        matno=matno+1;
    end
end


