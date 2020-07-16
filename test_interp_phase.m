close all
clear variables

%% truth
xmin=0;
xmax=2*pi*3;
x=xmin:.1:xmax;
x=x.';
%r=1:(10-1)/(length(x)-1):10;
r=x;
%r=1
z=r.*exp(1i*x);
%z=z.';

figure
plot(x/pi,abs(z),'DisplayName','truth: magnitude')
grid on
xlabel('phase/pi')
hold on
plot(x/pi,real(z),'DisplayName','truth: real')
plot(x/pi,imag(z),'DisplayName','truth: imaginary')

%% sampling
x1=1:3:floor(xmax);
z1=interp1(x,z,x1);
%a1=angle(z1);
%a1b=atan2(imag(z1),imag(z1));
style='x';
name='sample';
plot(x1/pi,real(z1),style,'DisplayName',name)
plot(x1/pi,imag(z1),style,'DisplayName',name)
plot(x1/pi,abs(z1),style,'DisplayName',name)

%% interpolation
% interp on components
x2=xmin:.25:xmax;
z2=interp1(x1,z1,x2);
style='-o';
name='interp components';
plot(x2/pi,real(z2),style,'DisplayName',name)
plot(x2/pi,imag(z2),style,'DisplayName',name)
plot(x2/pi,abs(z2),style,'DisplayName',name)

% interp on magnitude
mag=abs(z1);
phase=angle(z1);
m2=interp1(x1,mag,x2);
a2=interp1(x1,phase,x2);
z3=m2.*exp(1i*a2);
style='--+';
name='iterp phase';
plot(x2/pi,real(z3),style,'DisplayName',name)
plot(x2/pi,imag(z3),style,'DisplayName',name)
plot(x2/pi,abs(z3),style,'DisplayName',name)

% interp on phase
phase2=unwrap(phase);
a2b=interp1(x1,phase2,x2);
z3b=m2.*exp(1i*a2b);
style=':*';
name='unwrap phase';
plot(x2/pi,real(z3b),style,'DisplayName',name)
plot(x2/pi,imag(z3b),style,'DisplayName',name)
plot(x2/pi,abs(z3b),style,'DisplayName',name)

legend('Location','Northwest')

autoArrangeFigures