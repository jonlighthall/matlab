close all
clear variables

lat1=0:15:90;

ln=length(lat1);
lat2=ones(1,ln);
lon1=zeros(1,ln);
lon2=zeros(1,ln);

check_dist(lat1,lon1,lat2,lon2)

clear variables

lat0=30.427528; 
lon0=-90.091442;

dist_max=5500;
arc_max=km2deg(dist_max,'earth');
%arc_max=179;
step=10000;
arc=0:arc_max/(step-1):arc_max;

if isrow(arc)
    arc=arc';
end
bear_max=90;
%bear=rand(step,1)*bear_max;
bear=rand(step,1)*bear_max*2-bear_max;
%bear=0:bear_max/(step-1):bear_max;
%bear=-bear_max:2*bear_max/(step-1):bear_max;
if isrow(bear)
    bear=bear';
end

lat=ones(step,1).*lat0;
lon=ones(step,1).*lon0;

[a,b]=reckon(lat,lon,arc,bear);

c=check_dist(lat,lon,a,b);

ymax=dist_max/100/5;
ymin=-ymax;

plot(c.distance,c.dist,'.')
xlabel('range (m) from distance() (MATLAB)')
ylabel('range (m) from dist() (open)')
grid on

figure
plot(c.distance,arc,'.')
xlabel('range (km) from distance() (MATLAB)')
ylabel('arc distance (degrees)')
grid on

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
