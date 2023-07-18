close all
clear variables
rng('default');

nr=256;
nz=768;

A=rand(nr,nz);
B=rand(nr,nz);
%B=A.*1.001;

a=ssim(A,B);
b=immse(A,B);
fprintf('Before: %f, %f\n',a,b)

smin = 50;
sspan= 70;
smax = smin +sspan;

sA=sspan.*A+smin;
sB=sspan.*B+smin;

sc=2;
sa=0;
sA=A.*sc+sa;
sB=B.*sc+sa;

aa=ssim(sA,sB);
bb=immse(sA,sB);

fprintf(' After: %f, %f\n',aa,bb)