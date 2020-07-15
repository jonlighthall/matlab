close all
clear variables

%% truth
xmin=0;
xmax=2*pi;
x=xmin:.1:xmax;
x=x.';
%r=1:(10-1)/(length(x)-1):10;
r=x;
%r=1
z=r.*exp(1i*x);
%z=z.';

figure
plot(x/pi,abs(z))
grid on
hold on
plot(x/pi,real(z))
plot(x/pi,imag(z))

%% sampling
x1=1:1:floor(xmax);
z1=interp1(x,z,x1);
a1=angle(z1);
a1b=atan2(imag(z1),imag(z1));
style='x';
plot(x1/pi,real(z1),style)
plot(x1/pi,imag(z1),style)
plot(x1/pi,abs(z1),style)

%% interpolation
% interp on components
x2=xmin:.25:xmax;
z2=interp1(x1,z1,x2);
style='-o';
plot(x2/pi,real(z2),style)
plot(x2/pi,imag(z2),style)
plot(x2/pi,abs(z2),style)

% interp on magnitude
mag=abs(z1);
phase=angle(z1);
m2=interp1(x1,mag,x2);
a2=interp1(x1,phase,x2);
z3=m2.*exp(1i*a2);
style='--+';
plot(x2/pi,real(z3),style)
plot(x2/pi,imag(z3),style)
plot(x2/pi,abs(z3),style)

% interp on phase
phase2=unwrap(phase);
a2b=interp1(x1,phase2,x2);
z3b=m2.*exp(1i*a2b);
style=':*';
plot(x2/pi,real(z3b),style)
plot(x2/pi,imag(z3b),style)
plot(x2/pi,abs(z3b),style)
