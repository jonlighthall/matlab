close all
clear variables

% NOLA
lat0=30; 
lon0=-90;

% maximum distance in km
dist_max=5500;
arc_max=km2deg(dist_max,'earth');
step=10000;
% arc=0:arc_max/(step-1):arc_max;
% if isrow(arc)
%     arc=arc';
% end

% maximum bearing in degrees
bear_max=90;
% random
%bear=rand(step,1)*bear_max;
bear=rand(step,1)*bear_max*2-bear_max;
% sequential
%bear=0:bear_max/(step-1):bear_max;
%bear=-bear_max:2*bear_max/(step-1):bear_max;
% mod
%bear=mod(1:step,360);
%bear=mod(1:step,bear_max);
if isrow(bear)
    bear=bear';
end

% calculate endpoints
lat=ones(step,1).*lat0;
lon=ones(step,1).*lon0;
% arc in degrees
%[a,b]=reckon(lat,lon,arc,bear);
% arc in m
arc=rand(step,1)*dist_max*1000;
[a,b]=reckon(lat,lon,arc,bear,referenceEllipsoid('wgs84'));

geoplot(a,b,'.')

c=check_dist(lat,lon,a,b);

% plots
% ymax=dist_max/100/5;
% ymin=-ymax;
% plot(c.distance,c.dist,'.')
% xlabel('range (m) from distance() (MATLAB)')
% ylabel('range (m) from dist() (open)')
% grid on
% 
% figure
% plot(c.distance,arc,'.')
% xlabel('range (km) from distance() (MATLAB)')
% ylabel('arc distance (degrees)')
% grid on

figure
plot(c.distance,c.diff,'.')
xlabel('range (m) from distance() (MATLAB)')
ylabel('difference (m)')
%ylim([ymin ymax])
grid on

figure
plot(bear,c.diff,'.')
xlabel('bearing (deg)')
ylabel('difference (m)')
%ylim([ymin ymax])
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
autoArrangeFigures
grid on
