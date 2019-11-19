function rad = geod2rad(lat,f,req)
%GEOD2RAD Calcuates geocentric radius as a function of geodetic latitude.
%   Returns the distance RAD from the center of a spheroid to the elipical
%   surface with flattening F and equatorial radius REQ at geodetic
%   latitude LAT, specified in degrees.
%
%   RAD = GEOD2RAD(LAT) returns geocentric radius in meters of the earth at
%   latidue LAT in degrees. The units of RAD are in meters.
%
%   RAD = GEOD2RAD(LAT,MODEL) returns the radius in meters of the reference
%   ellipsoid MODEL at latitude LAT in degrees. The units of RAD are in
%   meters.
%
%   RAD = GEOD2RAD(LAT,F,REQ) returns the radius of an ellipsoid with
%   flattening F and semimajor (equitorial) axis REQ at geodetic latitude
%   LAT in degrees. The units of RAD will match the units of REQ.
%
%   See also GEOC2RAD

switch nargin
    case 3
        rpol=req*(1-f);
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

a=req;
b=rpol;
phi=deg2rad(lat);

% radius as a function of geodetic latitude
rad = sqrt(((a.^2.*cos(phi)).^2+(b.^2.*sin(phi)).^2)./...
    ((a.*cos(phi)).^2+(b.*sin(phi)).^2));
end
