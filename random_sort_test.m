close all
clear variables
rng('default');
N=1e4;
a=rand(N,1);
[a_sort,a_idx]=sort(a,'ascend');
[x,a_rank]=sort(a_idx);

show=[1:2 length(a)-1:length(a)];
dp=ceil(log10(N))+1;
fmt=sprintf('%%%dd %%%d.%df\\n',dp,dp+3,dp+1);
for i=1:length(show)    
fprintf(fmt,x(show(i)),a_sort(show(i)));
end