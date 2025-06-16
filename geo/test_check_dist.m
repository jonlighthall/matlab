close all
clear variables

% NOLA
lat0=30; 
lon0=-90;

% maximum distance in km
dist_max=5500;
arc_max=km2deg(dist_max,'earth');
step=10000;

% maximum bearing in degrees
bear_max=90;
bear=rand(step,1)*bear_max*2-bear_max;

% calculate endpoints
lat=ones(step,1).*lat0;
lon=ones(step,1).*lon0;
arc=rand(step,1)*dist_max*1000;
[a,b]=reckon(lat,lon,arc,bear,referenceEllipsoid('wgs84'));

% calculate distance
c=check_dist(lat,lon,a,b);

% plots
geoplot(a,b,'.')

figure
plot(c.distance,c.diff,'.')
xlabel('range (m) from distance() (MATLAB)')
ylabel('difference (m)')
grid on

figure
plot(bear,c.diff,'.')
xlabel('bearing (deg)')
ylabel('difference (m)')
grid on

figure
plot(c.distance,c.diff./c.distance*100,'.')
xlabel('range (m) from distance() (MATLAB)')
ylabel('percent difference')
grid on

figure
plot(bear,c.diff./c.distance*100,'.')
xlabel('bearing (deg)')
ylabel('percent difference')
grid on

autoArrangeFigures(1)
