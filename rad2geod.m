function [phi] = rad2geod(psi,r,model,R)
%GEOC2GEOD Convert geocentric latitude to geodetic latitude.
%   Replaces geoc2geod from the Aerospace Toolbox.
%
%   See also GEOC2GEOD GEOD2GEOC GEODETICLATITUDEFROMGEOCENTRIC
%   GEOCENTRICLATITUDE
switch nargin
    case 4
        E=oblateSpheroid;
        E.InverseFlattening=1/model;
        E.SemimajorAxis=R;
    case 3
        E=referenceEllipsoid(model);
    case 2
        E=referenceEllipsoid('Earth');
end
f=E.Flattening;
R=E.SemimajorAxis;
ua=geoc2geod(psi,f); % geocentric latitude at point on surface intersecting radius
ra=geoc2rad(psi,f,R); % geocentric radius at point on surface intersecting radius
l=r-ra; %geocentric altitude
dlamda=ua-psi;
h=l.*cosd(dlamda); %geodetic height
rhoa=R.*(1-f).^2./(1-(2.*f-f.^2).*sind(ua).^2).^(3/2);
du=rad2deg(atan2(l.*sind(dlamda),rhoa+h));
phi=ua-du;
end

