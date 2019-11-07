function [glat] = geoc2geod(lat,f,do_match,R)
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
        do_radius=true;
        model=do_match;
        E=oblateSpheroid;
        E.InverseFlattening=1/model;
        E.SemimajorAxis=R;       
    case 3
        if(ischar(do_match))
            % assuming geocentricLatitude input
            if(strcmp(do_match,'degrees')==1)
                do_match=true;
            elseif(strcmp(do_match,'radians')==1)
                do_match=true;
                do_radian=true;
            else
                % assuming geoc2geod input
                do_radius=true;
                model=do_match;
                E=referenceEllipsoid(model);
            end
        end
    case 2
        if f>1/5
            % assuming geod2geoc input
            do_radius=true;
            E=referenceEllipsoid('Earth');
        end
        do_match=true;
end

if(do_radius)
    r=f;
    f=E.Flattening;
    R=E.SemimajorAxis;
end

if(f==0)
    glat=lat;
else
    if(do_radian)
        glat=atan2(sin(lat)/((1-f)^2),cos(lat));
    else            
        glat=atan2d(sind(lat)/((1-f)^2),cosd(lat));
        if(~do_match)
            glat=mod(glat,360);
        end
        if(do_radius)
            ua=glat;
            ra=geoc2rad(lat,f,R); % geocentric radius at point on surface intersecting radius
            l=r-ra; %g  eocentric altitude
            dlamda=ua-lat;
            h=l.*cosd(dlamda); %geodetic height
            rhoa=R.*(1-f).^2./(1-(2.*f-f.^2).*sind(ua).^2).^(3/2);
            %rhoa=rcurve('meridian',E,ua,'degrees');
            du=rad2deg(atan2(l.*sind(dlamda),rhoa+h));
            phi=ua-du;
            glat=phi;
        end
    end
end
end

