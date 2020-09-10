a=sqrt(2);
b=0;
p=2+sqrt(2);

i=1;
while a>1
b=((1+b)*sqrt(a))/(a+b);
a=(sqrt(a)+1/sqrt(a))/2;
p=((1+a)*p*b)/(1+b);
fprintf('%d %f %f %f\n',i,a,b,p)
i=i+1;
end