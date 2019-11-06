function rad = geocentrad(lat,f,req)
%GEOCENTRAD Calcuates geocentric radius as a function of geocentric
%latitude.
%   Returns the distance RAD from the center of a spheroid to an elipical
%   surface with flattening F and equatorial radius REQ at geocentric
%   latitude LAT, specified in degrees.
%
%   RAD = GEOCENTRAD(LAT) returns geocentric radius in meters of the earth
%   at latidue LAT in degrees.
%
%   RAD = GEOCENTRAD(LAT,MODEL) returns the radius in meters of the
%   reference ellipsoid MODEL at latitude LAT in degrees. The units of RAD
%   are in meters.
%
%   RAD = GEOCENTRAD(LAT,F,REQ) returns the radius of an ellipsoid with
%   flattening F and semimajor (equitorial) axis REQ at geocentric latitude
%   LAT in degrees. The units of RAD will match the units of REQ.
%
%   Replaces GEOCRADIUS

switch nargin
    case 3
        rpol=req*(1-f);
        fprintf('calculating radius for ellipsoid with semimajor axis ',...
            '%f and semiminor axis %f',req,rpol);
    case 2
        E=referenceEllipsoid(f);
        req=E.SemimajorAxis;
        f=E.Flattening;
        rpol=req*(1-f);
    case 1
        E=wgs84Ellipsoid;
        req=E.SemimajorAxis;
        f=E.Flattening;
        rpol=req*(1-f);
    otherwise
        disp('please enter either 1 or 3 arguments')
        return
end

% convert to geodetic latitude
glat=geoc2geod(lat,f);

% convert to standard notation
a=req;
b=rpol;
phi=deg2rad(glat);

% radius as a function of geodetic latitude
rad = sqrt(((a.^2.*cos(phi)).^2+(b.^2.*sin(phi)).^2)./...
    ((a.*cos(phi)).^2+(b.*sin(phi)).^2));
end
