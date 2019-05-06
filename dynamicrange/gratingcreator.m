%gratingcreator-M.U.C.

x=0:.1:10;
a=1; %%%number of harmonics for the first cycle. keep this as 1 for summations.
ysummed=sin(x*a)/a; 
noofsummations=1; %%% enter here number of summations you do. 
                  %%% keep as 1 if you only want one harmonic.

if noofsummations>1
    for i=3:2:(3+2*noofsummations)
    ysummed=ysummed+sin(x*i)/i;
    end
end

ysummed=(ysummed+1)/2;
xsummed=ysummed;
[Xsummed,Ysummed]=meshgrid(xsummed,ysummed);
imshow(Xsummed)
figure;plot(x,ysummed);
ylim([0 1])