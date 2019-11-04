function rad = geocentrad(lat,f,req)
%GEOCENTRAD Calcuates geocentric radius as a function of geodetic latitude.
%   Returns the distance RAD from the center of a spheroid to an elipical
%   surface with flattening F and equatorial radius REQ at geodetic
%   latitude LAT, specified in degrees.
%
%   RAD = GEOCENTRAD(LAT) returns geocentric radius of the earth in meters
%   at latidue LAT in degrees.
%
%   RAD = GEOCENTRAD(LAT,F,REQ) returns the radius of an ellipsoid with
%   flattening F and semimajor (equitorial) axis REQ at latitude LAT in
%   degrees. The units of RAD will match the units of REQ.
% 
%   Replaces GEOCRADIUS

switch nargin
    case 3
        rpol=req*(1-f);
        fprintf('calculating radius for ellipsoid with semimajor axis %f and semiminor axis %f',req,rpol);
    case 1
        E=wgs84Ellipsoid;
        req=E.SemimajorAxis;
        f=E.Flattening;
        rpol=req*(1-f);
    otherwise
        disp('please enter either 1 or 3 arguments')
        return
end

a=req;
b=rpol;
phi=deg2rad(lat);

% from https://en.wikipedia.org/wiki/Earth_radius#Geocentric_radius
rad = sqrt(((a.^2.*cos(phi)).^2+(b.^2.*sin(phi)).^2)./((a.*cos(phi)).^2+(b.*sin(phi)).^2));
end
