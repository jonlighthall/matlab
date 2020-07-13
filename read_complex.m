clear variables
close all
filename='initial_u.txt';
fid=fopen(filename);
data = fscanf(fid, '%f (%g,%g)',[3,Inf]);
fclose(fid);