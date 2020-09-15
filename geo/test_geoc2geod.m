% test geoc2geod inputs/outputs
radius=6379136;
% test 2 inputs
gd = geoc2geod(45, radius)
% test 3 inputs with arrayed lat
gd = geoc2geod([0 45 90], radius, 'WGS84')
% test 4 inputs
f = 1/196.877360;
Re = 3397000;
gd = geoc2geod([0 45 90], radius, f, Re)

% test geodeticLatitudeFromGeocentric inputs/outputs
s = wgs84Ellipsoid;
geoc2geod(45, s.Flattening)
geoc2geod(pi/3, s.Flattening, 'radians')