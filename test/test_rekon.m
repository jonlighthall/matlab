close all 
clear variables

d=600;
range_deg = nm2deg(d);
lat=51.5;
lon=0;
az=315;
pt1 = reckon(lat,lon,range_deg,az) ; 
pt2 = reckon('rh',lat,lon,range_deg,az);
separation = distance('gc',pt1,pt2);
nmsep = deg2nm(separation)  ;
fprintf('Difference between great circle and rhumb line: %.1f nmi\n',nmsep)

figure
mksz=10;
lnwd=3;
geoplot(lat,lon,'x','MarkerSize',mksz,'linewidth',lnwd)
hold on
geoplot(pt1(1),pt1(2),'o','MarkerSize',mksz,'linewidth',lnwd)
geoplot(pt2(1),pt2(2),'+','MarkerSize',mksz,'linewidth',lnwd)

E = referenceEllipsoid('wgs84');

% The "arc length" must be expressed same unit of length as the semimajor
% axis of the ellipsoid.
load_constants;
distm=d*nmi2m; % convert to meters

pt3=reckon(lat,lon,distm,az,E);
geoplot(pt3(1),pt3(2),'s','MarkerSize',mksz,'linewidth',lnwd)

% When ellipsoid is specified, arc lenth is expressed in the same length
% units as the semimajor axis of the ellipsoid.
separation2 = distance(pt1,pt3,E);
nmsep2 = separation2*m2nmi;
fprintf('Difference between great circle and wgs84: %.1f nmi\n',nmsep2)

%% Use dist() to plot geodesic paths
N=100;
[~,glat,glon]=dist([lat pt3(1)],[lon pt3(2)],N);
geoplot(glat,glon)

[~,glat,glon]=dist([lat pt1(1)],[lon pt1(2)],N,'sphere');
geoplot(glat,glon)

%% Plot two-point paths
geoplot([lat pt2(1)],[lon pt2(2)])
geoplot([lat pt1(1)],[lon pt1(2)],':')
geoplot([lat pt3(1)],[lon pt3(2)],':')

%% Use track2() to plot geodesics and rhumb lines 
[latgc,longc] = track2(lat,lon,pt1(1),pt1(2));
geoplot(latgc,longc,'--')

[latgc,longc] = track2('rh',lat,lon,pt2(1),pt2(2));
geoplot(latgc,longc,'--')