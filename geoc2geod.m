function [glat] = geoc2geod(lat,f,do_match,~)
%GEOC2GEOD Convert geocentric latitude to geodetic latitude. Only valid for
%points on the surface of the ellipsoid.
%   Replaces geocentricLatitude from the Mapping Toolbox and geoc2geod from
%   the Aerospace Toolbox.
%
%   See also GEODETICLATITUDEFROMGEOCENTRIC GEOCENTRICLATITUDE GEOD2GEOC
do_rad=false;
switch nargin
    case 4
        % assuming geod2geoc input
        lat=lat';
        f=do_match;
        do_match=true;
    case 3
        if(ischar(do_match))
            % assuming geocentricLatitude input
            if(strcmp(do_match,'degrees')==1)
                do_match=true;
            elseif(strcmp(do_match,'radians')==1)
                do_match=true;
                do_rad=true;
            else
                % assuming geoc2geod input
                E=referenceEllipsoid(do_match);
                f=E.Flattening;
                fprintf('not valid for non-zero altitudes')
            end
        end
    case 2
        if f>1/5
            % assuming geod2geoc input
            E=referenceEllipsoid('Earth');
            f=E.Flattening;
            fprintf('not valid for non-zero altitudes')
        end
        do_match=true;
end

if(f==0)
    glat=lat;
else
    if(do_rad)
        glat=atan2(sin(lat)/((1-f)^2),cos(lat));
    else
        glat=atan2d(sind(lat)/((1-f)^2),cosd(lat));
        if(~do_match)
            glat=mod(glat,360);
        end
    end
end
end

