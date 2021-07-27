function [phi] = geoc2geod(psi,f,do_match,R)
%GEOC2GEOD Convert geocentric latitude to geodetic (map) latitude. Only valid for points on the surface of the ellipsoid.
%
%   Replaces geodeticLatitudeFromGeocentric from the Mapping Toolbox and
%   geoc2geod from the Aerospace Toolbox. Input for either function are
%   accepted and outputs are matched (see below).
%
%   phi = geoc2geod(psi,f) returns the geodetic latitude corresponding to
%   geocentric latitude psi on an ellipsoid with flattening f.
%
%   phi = geoc2geod(psi,f,angleUnit) specifies the units of input psi and
%   output phi.
%
%   phi = geoc2geod(psi,f,do_match) specifies the output to match the atan2
%   behavior of the original function.
%
%   phi  = geoc2geod(psi, radii) converts an array of m-by-1 geocentric
%   latitudes and an array of radii from the center of the planet into an
%   array of m-by-1 geodetic latitudes.
% 
%   phi  = geoc2geod(psi, radii, model) converts for a specific ellipsoid
%   planet.
% 
%   phi  = geoc2geod(psi, radii, f, equatorialRadius) converts for a custom
%   ellipsoid planet defined by flattening f and the equatorial radius.
% 
%   See also GEODETICLATITUDEFROMGEOCENTRIC GEOCENTRICLATITUDE GEOC2GEOD
%   GEOD2GEOC
do_radian=false;
do_radius=false;
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
    phi=psi;
else
    if(do_radian)
        phi=atan2(sin(psi)/((1-f)^2),cos(psi));
    else            
        phi=atan2d(sind(psi)/((1-f)^2),cosd(psi));
        if(~do_match)
            phi=mod(phi,360);
        end
        if(do_radius)
            ua=phi;
            ra=geoc2rad(psi,f,R); % geocentric radius at point on surface intersecting radius
            l=r-ra; %geocentric altitude
            dlamda=ua-psi;
            h=l.*cosd(dlamda); %geodetic height
            rhoa=R.*(1-f).^2./(1-(2.*f-f.^2).*sind(ua).^2).^(3/2);
            %rhoa=rcurve('meridian',E,ua,'degrees');
            du=rad2deg(atan2(l.*sind(dlamda),rhoa+h));
            phi=ua-du;
        end
    end
end
end

