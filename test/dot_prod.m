% test dot product intrinsic with manual calculation
clear variables
n=4;
tic
s=rand(4,n);

for i=1:n
    A(i)=complex(s(i*4-3),s(i*4-2));
    B(i)=complex(s(i*4-1),s(i*4-0));
end
C = dot(A,B);

for i=1:length(A)
    c1(i)=A(i)*(B(i));
    c2(i)=A(i)*conj(B(i));
    c3(i)=conj(A(i))*B(i);
    c4(i)=conj(A(i))*conj(B(i));
end

c1=sum(c1);
c2=sum(c2);
c3=sum(c3);
c4=sum(c4);

if C==c1
    fprintf('no conj matches\n')
elseif C==c2
    fprintf('conj B matches\n')
elseif C==c3
    fprintf(' conj A matches\n')
elseif C==c4
    fprintf('both conj matches\n')
end
toc