function rad = geocentrad(lat,req,rpol)
%GEOCENTRAD Calcuates geocentric radius as a function of geodetic latitude.
%   Returns the distance RAD from the center of a spheroid to an elipical
%   surface with equatorial radius REQ and polar radius RPOL at geodetic
%   latitude LAT, specified in degrees.
%
%   RAD = GEOCENTRAD(LAT) returns geocentric radius of the earth in meters
%   at latidue LAT in degrees.
%
%   RAD = GEOCENTRAD(LAT,REQ,RPOL) returns the radius of an ellipsoid with
%   semimajor (equitorial) axis REQ and semiminor (polar) axis RPOL at
%   latitude LAT in degrees. The units of RAD will match the units of REQ
%   and RPOL.

switch nargin
    case 3
        fprintf('calculating radius for ellipsoid with semimajor axis %f and semiminor axis %f',req,rpol);
    case 1
        E=wgs84Ellipsoid;
        req=E.SemimajorAxis;
        rpol=E.SemiminorAxis;
    otherwise
        disp('please enter either 1 or 3 arguments')
        return
end

a=req;
b=rpol;
phi=deg2rad(lat);

rad = sqrt(((a.^2.*cos(phi)).^2+(b.^2.*sin(phi)).^2)./((a.*cos(phi)).^2+(b.*sin(phi)).^2));
end
