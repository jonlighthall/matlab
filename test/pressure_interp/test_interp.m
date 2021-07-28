close all
clear all

x = 0:pi/4:2*pi; 
v = sin(x);
xq = 0:pi/16:2*pi;
figure
vq1 = interp1(x,v,xq);
plot(x,v,'o',xq,vq1,':.');
xlim([0 2*pi]);
title('(Default) Linear Interpolation');
grid on
hold on
vq2 = interp1(x,v,xq,'spline');
plot(xq,vq2,'--');

x2=0:pi/4/10:2*pi;
v2=sin(x2);
figure 
plot(x2,v2,'.-')
y2=cos(x2);
grid on
hold on 
plot(x2,y2,'.-')

p=complex(v2,y2);
mag=abs(p);
phase=angle(p);

figure
plot(phase,mag,'.')
hold on
plot(phase,real(p),'.')
plot(phase,imag(p),'.')
