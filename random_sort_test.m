close all
clear variables
rng('default');
N=5;
a=rand(N,1);
[a_sort,a_idx]=sort(a,'ascend');
[x,a_rank]=sort(a_idx);

N_choose=5;
N_choose=min([N_choose floor(N/2)]);
show=[1:N_choose length(a)-(N_choose-1):length(a)];
dp=ceil(log10(N))+1;
dp=max([dp 4]);

fmt=sprintf('%%%ds %%%ds %%%ds\\n',dp,dp,dp+3);
fprintf(fmt,'rad','rank','value');

fmt=sprintf('%%%dd %%%dd %%%d.%df\\n',dp,dp,dp+3,dp+1);
for i=1:length(show)    
fprintf(fmt,a_idx(show(i)),x(show(i)),a_sort(show(i)));
end