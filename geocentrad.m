function [rad] = geocentrad(lat,req,rpol)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
switch nargin
    case 3
        
    case 1
        E=wgs84Ellipsoid;
        req=E.SemimajorAxis;
        rpol=E.SemiminorAxis;
    otherwise
        disp('please enter either 1 or 3 arguments')
        return
end

a=req;
b=rpol;
phi=deg2rad(lat);

rad = sqrt(((a^2*cos(phi))^2+(b^2*sin(phi))^2)/((a*cos(phi))^2+(b*sin(phi))^2));
end

