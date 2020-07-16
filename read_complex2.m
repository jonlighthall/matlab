clear variables
close all

%% read in file
%filename='initial_u.txt';
%filename='short_u.txt';
filename='mid_u.txt';
fid=fopen(filename);
data = fscanf(fid, '%f (%g,%g)',[3,Inf]);
fclose(fid);
data=data.';

%% parse data
depth=data(:,1);
p=complex(data(:,2),data(:,3));
mag=abs(p);
phase=angle(p);
phase2=unwrap(phase);

% plot(phase,mag)
% grid on
% xlabel('phase')
% hold on
% plot(phase,real(p))
% plot(phase,imag(p))
% 
% figure
% plot(phase2,mag)
% grid on
% xlabel('phase (unwrapped)')
% hold on
% plot(phase2,real(p))
% plot(phase2,imag(p))


%% set ouput grid
depthv=1:1:max(depth);

%% interpolate values
vmag=interp1(depth,mag,depthv);
vphase=interp1(depth,phase,depthv);
vphase2=interp1(depth,phase2,depthv);

vreal=interp1(depth,real(p),depthv);
vimag=interp1(depth,imag(p),depthv);

%% calculate complex pressure
vcomp=complex(vreal,vimag);
vp=vmag.*exp(1i*vphase);
vp2=vmag.*exp(1i*vphase2);

% figure
% plot(phase,depth)
% grid on
% axis ij
% ylabel('depth')
% hold on
% style1='x:';
% plot(phase2,depth)
% plot(angle(vp),depthv,style1)
% style2='o:';
% plot(angle(vp2),depthv,style2)
% %plot(angle(vp2),depthv,style2)
% style3='*:';
% plot(angle(vcomp),depthv,style3)
% plot(unwrap(angle(vcomp)),depthv,style3)
% title('phase')

figure
plot(mag,depth)
grid on
axis ij
ylabel('depth')
hold on
style1='x:';
plot(abs(vp),depthv,style1)
style2='o:';
plot(abs(vp2),depthv,style2)
style3='*:';
plot(abs(vcomp),depthv,style3)
title('magnitude')
legend('data','mag/phas interp','unwrap','comp interp')

figure
plot(real(p),depth)
grid on
axis ij
ylabel('depth')
hold on
plot(real(vp),depthv,style1)
plot(real(vp2),depthv,style2)
plot(vreal,depthv,style3)
title('real')
legend('data','mag/phas interp','unwrap','comp interp')

figure
plot(imag(p),depth)
grid on
axis ij
ylabel('depth')
hold on
plot(imag(vp),depthv,style1)
plot(imag(vp2),depthv,style2)
plot(vimag,depthv,style3)
title('imaginary')
legend('data','mag/phas interp','unwrap','comp interp')

autoArrangeFigures
