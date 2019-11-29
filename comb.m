function [outputArg1,A] = comb(inputArg1,inputArg2)
%COMB Calculates the combinations of inputArg1 choose inputArg2
%   See also perm
outputArg1 = factorial(inputArg1)/(factorial(inputArg2)*factorial(inputArg1-inputArg2));
k=1;
A=zeros(outputArg1,2);
for i=1:inputArg1-1
    for j=i+1:inputArg1
        A(k,:)=[i,j];
        k=k+1;
    end
end
end

