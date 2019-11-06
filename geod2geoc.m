function [glat] = geod2geoc(lat,f,do_match)
%GEOD2GEOC Convert geodetic latitude to geocentric latitude.
%   Replaces geodeticLatitudeFromGeocentric from the Mapping Toolbox and
%   geod2geoc from the Aerospace Toolbox.
%
%   See also GEOCENTRICLATITUDE GEODETICLATITUDEFROMGEOCENTRIC GEOC2GEOD
do_rad=false;
switch nargin
    case 3
        if(strcmp(do_match,'degrees')==1)
            do_match=true;
        end
        if(strcmp(do_match,'radians')==1)
            do_match=true;
            do_rad=true;
        end
    case 2
        do_match=false;
    otherwise
        disp('please')
        return
end

if(f==0)
    glat=lat;
else
    if(do_rad)
        glat=atan2(sin(lat)*((1-f)^2),cos(lat));
    else
        glat=atan2d(sind(lat)*((1-f)^2),cosd(lat));
        if(~do_match)
            glat=mod(glat,360);
        end
    end
end
end

