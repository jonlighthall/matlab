r=1;
n=0;
ii=0;
step=1;
while ii<9
    d1=2*n+1;
    n1=2*(n+1);
    d2=2*(n+1)+1;
    r=r*(n1/d1)*(n1/d2);
    if mod(n,step)==0
        p=2*r;
        pival=floor(pi*10^ii);
        pval=floor(p*10^ii);
        if pival==pval
            fmt=sprintf('%s%d%s','%d %d %d %d %d %f %.',ii,'f\n');
            fprintf(fmt,ii,n,d1,n1,d2,r,p);
            ii=ii+1;
            step=n;
        end
    end
    n=n+1;
end