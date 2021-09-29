function [outputArg1,A] = comb(n,r)
%COMB Calculates nCr, the combinations of "n choose r"
%   See also perm
outputArg1 = factorial(n)/(factorial(r)*factorial(n-r));
k=1;
A=zeros(outputArg1,2);
for i=1:n-1
    for j=i+1:n
        A(k,:)=[i,j];
        k=k+1;
    end
end
end

