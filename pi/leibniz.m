r=0;
d=0;
%n=0;
%while (d<(1/realmin))
for n=0:1000000000
d=2*n+1;
c=(-1)^(n);
r=r+c/d;
%fprintf('%d %f %f %f %f\n',n,d,c,r,p)
%n=n+1;
end
p=4*r;
fprintf('%d %f %f %f %.20f\n',n,d,c,r,p)