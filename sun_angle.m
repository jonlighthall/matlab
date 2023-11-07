close all
clear variables 

% astronomical unit in m
au=149597870700;

% solar radius in m
solrad=6.95700e8;

% measured solar radius from Mercury transit
sunrad=696342e3;

% compare to definition
fprintf('The sun''s radius is %.8f au\n',solrad/au)

% solar diameter in m
soldia=2*solrad;

% angular szie in radians
del=2*atan(soldia/(2*au));

% angular size in degrees
ang=rad2deg(del);

% angular size in degrees
arcmin=ang*60; % should be between ~31.5 32.5 arcminutes

fprintf('The angular size of the sun is %.4f%s or %.2f''\n',ang,char(176),arcmin)

%arcsec=mod(arcmin,1)*60

% angular radius in degrees
angrad=ang/2 % should be about 1/4 deg

