function [outputArg1,A] = perm(n,r)
%PERM Calculates nPr
%
%   See also COMB
outputArg1 = factorial(n)/factorial(n-r);
k=1;
A=zeros(outputArg1,2);
for i=1:n
    for j=1:n
        if(i==j)
            continue
        else
            
            A(k,:)=[i,j];
            k=k+1;
        end
    end
end
end

