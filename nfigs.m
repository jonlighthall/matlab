function [n] = nfigs()
%NFIGS Summary of this function goes here
%   Detailed explanation goes here
h = findobj('type','figure');
n = length(h);
end

