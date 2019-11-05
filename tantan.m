function [out] = tantan(in)
a=rad2deg(atan(tan(deg2rad(in))));
q23=((in>90) &(in<=270));
q4 =((in>270)&(in<=360));
a=a+q23*180+q4*360;
out = a;
end

