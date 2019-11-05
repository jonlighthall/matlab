function [glat] = geoc2geod(lat,f,do_match)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
switch nargin
    case 3
    case 2
        do_match=false;
    otherwise
        disp('please')
        return
end

glat=atan(tan(deg2rad(lat))/((1-f)^2));

glat=rad2deg(glat);
q2=((lat> 90)&(lat<=180));
q3=((lat>180)&(lat<=270));
q4=((lat>270)&(lat<=360));

if(do_match)
    glat=glat+q2*180+q3*-180+q4*0;
else
    glat=glat+q2*180+q3*180+q4*360;
end
end

