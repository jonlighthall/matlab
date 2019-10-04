close all
clear variables
data=readtable('locations.txt');
len=length(data.index);
long=zeros(len*2,1);
lat=zeros(len*2,1);
for i=1:len
    long(2*i-1)=data.long_r(i);
    long(2*i)=data.long_s(i);
    lat(2*i-1)=data.lat_r(i);
    lat(2*i)=data.lat_s(i);
end

varNames = {'clarke' ;'iau73'; 'wgs84';'sphere'};

range=zeros(len,1);
b=zeros(len,1);
br=zeros(len,1);
for i=1:len
   [range(i),b(i),br(i)]=dist(lat(2*i-1:2*i),long(2*i-1:2*i),char(varNames(4)));
end
data.range=range;
data.bearing=b;
data.reverse=br;

sz = [len 4];
varTypes =  strings([4,1])+'double';

ranges = table('Size',sz,'VariableTypes',varTypes','VariableNames',varNames);
bearings= table('Size',sz,'VariableTypes',varTypes','VariableNames',varNames);
rng=zeros(len,4);
for i=1:len
    for j=1:4
        [rng(i,j),az(i,j),azr(i,j)]=dist(lat(2*i-1:2*i),long(2*i-1:2*i),char(varNames(j)));
        az(i,j)=mod(az(i,j)+360,360);
        azr(i,j)=mod(azr(i,j)+360,360);
    end
    fprintf('%2i r = %9.1f std = %f diff = %f (%f%%)\n',i,mean(rng(i,1:3)),...
        std(rng(i,1:3)),(mean(rng(i,4))-mean(rng(i,1:3))),...
        (mean(rng(i,4))-mean(rng(i,1:3)))/rng(i,4))*100;
end
ranges.Variables=rng;
bearings.Variables=az;

ranges.clarke2=zeros(len,1);
ranges.iau68=zeros(len,1);
ranges.earth=zeros(len,1);
ranges.sphere2=zeros(len,1);
bearings.clarke1=zeros(len,1);
bearings.iau68=zeros(len,1);
bearings.earth=zeros(len,1);
bearings.sphere2=zeros(len,1);

varNames(5:8)={'clarke66';'iau68';'earth';'unitsphere'};

for i=1:len
    for j=5:8
    [rng(i,j),az(i,j)]=distance(lat(2*i-1),long(2*i-1),lat(2*i),...
        long(2*i),referenceEllipsoid(char(varNames(j))));
    [~,azr(i,j)]=distance(lat(2*i),long(2*i),...
        lat(2*i-1),long(2*i-1),referenceEllipsoid(char(varNames(j))));
    end   
    rng(i,8)=rad2km(rng(i,8))*1000;
end
ranges.Variables=rng;
bearings.Variables=az;