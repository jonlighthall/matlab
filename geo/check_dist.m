function check_dist(lat1,lon1,lat2,lon2,ellipoid)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if (nargin <5)
    ellipoid='wgs84';
end

[r_distance,b_distance]=distance(lat1,lon1,lat2,lon2,...
    referenceEllipsoid(ellipoid));

ln=length(lat1);
r_dist=zeros(1,ln);
for i=1:ln
   [r_dist(i),b_dist,br_dist]=dist([lat1(i) lat2(i)],[lon1(i) lon2(i)],...
       ellipoid);
end
col=2;
sz = [ln col];
varTypes =  strings([col,1])+'double';
varNames = {'distance';'dist'};
ranges = table('Size',sz,'VariableTypes',varTypes','VariableNames',varNames);

ranges.dist=r_dist';
ranges.distance=r_distance;
ranges.diff=r_dist'-r_distance;
disp(ranges)
end

