% test geoc2geod inputs/outputs
gd = geoc2geod(45, 6379136)
gd = geoc2geod([0 45 90], 6379136, 'WGS84')
f = 1/196.877360;
Re = 3397000;
gd = geoc2geod([0 45 90], 6379136, f, Re)

% test geodeticLatitudeFromGeocentric inputs/outputs
s = wgs84Ellipsoid;
geoc2geod(45, s.Flattening)
geoc2geod(pi/3, s.Flattening, 'radians')