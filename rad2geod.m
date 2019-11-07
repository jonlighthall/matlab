function [phi] = rad2geod(lat,r,mod,R)
%GEOC2GEOD Convert geocentric latitude to geodetic latitude.
%   Replaces geocentricLatitude from the Mapping Toolbox and geoc2geod from
%   the Aerospace Toolbox.
%
%   See also GEODETICLATITUDEFROMGEOCENTRIC GEOCENTRICLATITUDE GEOD2GEOC
switch nargin
    case 4
        E=oblateSpheroid;
        E.InverseFlattening=1/mod;
        E.SemimajorAxis=R;
        
    case 3
        E=referenceEllipsoid(mod);
    case 2
        E=referenceEllipsoid('Earth');
        
end
f=E.Flattening;
R=E.SemimajorAxis;
ua=geoc2geod(lat,f); % geocentric latitude at point on surface intersecting radius
ra=geoc2rad(lat,f,R); % geocentric radius at point on surface intersecting radius
l=r-ra; %geocentric altitude
dlamda=ua-lat;
h=l.*cosd(dlamda); %geodetic height
rhoa=R.*(1-f).^2./(1-(2.*f-f.^2).*sind(ua).^2).^(3/2);
rhoa=rcurve('meridian',E,ua,'degrees');
du=rad2deg(atan2(l.*sind(dlamda),rhoa+h))
phi=ua-du;
end

