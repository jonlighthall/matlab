function [d] = divisor(n)
%DIVISOR integer factorization by trial division
%   Detailed explanation goes here
% denominators to test
k=1:ceil(n/2); 
% list of divisors
d=[k(rem(n,k)==0) n]; 
end