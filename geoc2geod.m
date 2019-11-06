function [glat] = geoc2geod(lat,f,do_match)
%GEOC2GEOD Convert geocentric latitude to geodetic latitude.
%   Replaces geocentricLatitude from the Mapping Toolbox and geoc2geod from
%   the Aerospace Toolbox.
%
%   See also GEODETICLATITUDEFROMGEOCENTRIC GEOCENTRICLATITUDE GEOD2GEOC
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
        do_match=true;
    otherwise
        disp('please')
        return
end

if(do_rad)
   
        glat=atan2(sin(lat)/((1-f)^2),cos(lat));
    end
else
    if(f==0)
        glat=lat;
    else
        glat=atan2d(sind(lat)/((1-f)^2),cosd(lat));
        if(~do_match)
            glat=mod(glat,360);
        end
    end
end
end

