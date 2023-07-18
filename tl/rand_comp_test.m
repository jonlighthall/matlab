close all
clear variables
rng('default');

nr=256;
nz=768;

% normalized
A=rand(nr,nz);
B=rand(nr,nz);

a=ssim(A,B);
b=immse(A,B);
fprintf('Before: %f, %f\n',a,b)

% scaled or un-normalized
sA=tlus(A);
sB=tlus(B);

aa=ssim(sA,sB);
bb=immse(sA,sB);

fprintf(' After: %f, %f\n',aa,bb)

% linear
clear sA sB
sc=2;
sa=0;
sA=A.*sc+sa;
sB=B.*sc+sa;
