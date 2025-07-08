function solar_dia_deg = sun_angle(distance_from_sun, solar_radius)
%SUN_ANGLE Calculate the angular size of the sun from a given distance.
%   ANG = SUN_ANGLE(DISTANCE_FROM_SUN) returns the angular size in degrees
%   of the sun as seen from DISTANCE_FROM_SUN (in meters).
%   If DISTANCE_FROM_SUN is not provided, the astronomical unit is used.

% astronomical unit in m
au=149597870700;

if nargin < 1
    % astronomical unit in m
    distance_from_sun = 1.0 * au; % default to 1 AU
end

% International Astronomical Union (IAU)
% nominal solar radius in m (R_sol^N)
% DOI 10.3847/0004-6256/152/2/41
nominal_solar_radius=6.95700e8;

% measured solar radius from Mercury transits
% https://arxiv.org/abs/1203.4898
% 696,342 ± 65km
solar_radius_2011=696342e3;

% arXiv:1605.09788
solar_radius_2018=695823e3;

if nargin < 2
    % use the nominal solar radius if not provided
    solar_radius = solar_radius_2018;
end

% solar diameter in m
solar_dia_meter=2*solar_radius;

% angular size in radians
solar_dia_rad=atan(solar_dia_meter/(distance_from_sun));

% angular size in degrees
solar_dia_deg=rad2deg(solar_dia_rad);

% angular size in degrees
solar_dia_arcmin=solar_dia_deg*60; % should be between ~31.5 32.5 arcminutes

% angular radius in degrees
solar_rad_deg=solar_dia_deg/2; % should be about 1/4 deg

% solar radius in arcseconds
solar_rad_arcsec=solar_rad_deg*3600; % should be about 960 arcseconds

if nargout > 0
    % return the angular size in degrees
    return
end
% if no output argument, print the results


fprintf('INPUTS:\n')
fprintf('  Distance from the sun: %.5g au\n',distance_from_sun/au)
fprintf('  Solar radius: %.5g nominal solar radii\n',solar_radius/nominal_solar_radius)

fprintf('OUTPUTS:\n')
fprintf('  Angular size: %.5f%s or %.5g'' or %.5g''''\n',solar_dia_deg,char(176),solar_dia_arcmin,solar_dia_arcmin*60)
fprintf('  Solar radius: %.5g%s or %.5g'' or %.5g''''\n',solar_rad_deg,char(176),solar_rad_arcsec/60,solar_rad_arcsec)
