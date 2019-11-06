function [glat] = geoc2geod(lat,f,do_match)
%GEOC2GEOD Convert geocentric latitude to geodetic latitude.
%   Replaces geocentricLatitude from the Mapping Toolbox and geoc2geod from
%   the Aerospace Toolbox.
%
%   See also GEODETICLATITUDEFROMGEOCENTRIC GEOCENTRICLATITUDE GEOD2GEOC
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

if(f~=0 && do_match)
    % match the output of geodeticLatitudeFromGeocentric using atan2, which
    % maps to -180 to +180
    glat=glat+q2*180+q3*-180+q4*0;
else
    glat=glat+q2*180+q3*180+q4*360;
end
end

