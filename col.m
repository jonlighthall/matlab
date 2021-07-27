function [vec] = col(color_name)
%COL Return vector of named color from buildcmap
%   Detailed explanation goes here

vec=buildcmap(color_name,1);