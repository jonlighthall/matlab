function [out] = tantan(in)
%TANTAN Retursn the so-called four quadrant inverse tanget. Input and
%output are in degrees.
%
%See also ATAN2D
a=rad2deg(atan(tan(deg2rad(in))));
q23=((in>90) &(in<=270));
q4 =((in>270)&(in<=360));
a=a+q23*180+q4*360;
out = a;
end

