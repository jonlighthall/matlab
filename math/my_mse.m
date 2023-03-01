function [outputArg1] = my_mse(A,B)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
outputArg1=sum((A(:)-B(:)).^2)/numel(A);
%outputArg1=(norm(A(:)-B(:),2).^2)/numel(A);
end