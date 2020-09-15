function ranges=check_dist(lat1,lon1,lat2,lon2,ellipoid)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if (nargin <5)
    ellipoid='wgs84';
end

if isrow(lat1)
   lat1=lat1'; 
end

if isrow(lat2)
   lat2=lat2'; 
end

if isrow(lon1)
   lon1=lon1'; 
end

if isrow(lon2)
   lon2=lon2'; 
end


[r_distance,b_distance]=distance(lat1,lon1,lat2,lon2,...
    referenceEllipsoid(ellipoid));

ln=length(lat1);
r_dist=zeros(1,ln);
b_dist=zeros(1,ln);
for i=1:ln
   [r_dist(i),b_dist(i),br_dist]=dist([lat1(i) lat2(i)],[lon1(i) lon2(i)],...
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
%disp(ranges)

bearings = table('Size',sz,'VariableTypes',varTypes','VariableNames',varNames);
bearings.dist=b_dist';
bearings.distance=b_distance;
bearings.diff=b_dist'-b_distance;
%disp(bearings)
end

