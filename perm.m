function [outputArg1,A] = perm(inputArg1,inputArg2)
%PERM Calculates the permutations of inputArg1 choose inputArg2
%
%   See also COMB
outputArg1 = factorial(inputArg1)/factorial(inputArg1-inputArg2);
k=1;
A=zeros(outputArg1,2);
for i=1:inputArg1
    for j=1:inputArg1
        if(i==j)
            continue
        else
            
            A(k,:)=[i,j];
            k=k+1;
        end
    end
end
end

