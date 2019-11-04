function rad = geocentrad(lat,req,rpol)
%GEOCENTRAD Calcuates geocentric radius as a function of geodetic latitude.
%   Returns the distance RAD from the center of a spheroid to an elipical
%   surface with equatorial radius REQ and polar radius RPOL at geodetic
%   latitude LAT.
%
%   RAD = GEOCENTRAD(LAT) returns geocentric radius of the earth in meters
%   at latidue LAT.
%
%   RAD = GEOCENTRAD(LAT,REQ,RPOL) returns the radius of an ellipsoid with
%   semimajor (equitorial) axis REQ and semiminor (polar) axis RPOL.

switch nargin
    case 3
        
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

rad = sqrt(((a^2*cos(phi))^2+(b^2*sin(phi))^2)/((a*cos(phi))^2+(b*sin(phi))^2));
end

