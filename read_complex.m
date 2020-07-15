clear variables
close all

% read in file
filename='initial_u.txt';
%filename='short_u.txt';
fid=fopen(filename);
data = fscanf(fid, '%f (%g,%g)',[3,Inf]);
fclose(fid);

% parse data
depth=data(1,:);
p=complex(data(2,:),data(3,:));
mag=abs(p);
phase=angle(p);

% set ouput grid
%depthv=depth;
depthv=1:0.25:max(depth);
%depthv=14:20;

% interpolate values
vmag=interp1(depth,mag,depthv);
vphase=interp1(depth,phase,depthv);
vreal=interp1(depth,data(2,:),depthv);
vimag=interp1(depth,data(3,:),depthv);
vcomp=complex(vreal,vimag);

plot(mag,depth)
axis ij
xlabel('pressure (magnitude)')
ylabel('depth')
grid on
hold on
plot(vmag,depthv,'x')
plot(abs(vcomp),depthv,'--')
legend('data','interp on mag, phase','inpterp on real, imag')

figure
plot(phase,depth)
axis ij
xlabel('phase')
ylabel('depth')
grid on
hold on
plot(vphase,depthv,'x')
plot(angle(vcomp),depthv,'--')
%plot(atan2(vimag,vreal),depthv,'+')
legend('data','interp on mag, phase','inpterp on real, imag')


% calculate other valuese

vp1=vmag.*(cos(vphase) +1i*sin(vphase));
vp2=vmag.*exp(1i*vphase);

ln=length(vmag);
vp=complex(zeros(ln,1),zeros(ln,1));
for k=1:ln
   vp(k)= vmag(k)*exp(1i*vphase(k));
end

figure
plot(real(p),depth)
axis ij
xlabel('pressure (real)')
ylabel('depth')
grid on
hold on
plot(real(vp),depthv,'x--')
%plot(real(vp1),depthv)
%plot(real(vp2),depthv,':')
plot(vreal,depthv,'o')
legend('data','interp on mag, phase','inpterp on real, imag')

figure
plot(imag(p),depth)
axis ij
xlabel('pressure (imaginary)')
ylabel('depth')
grid on
hold on
plot(imag(vp),depthv,'x')
%plot(imag(vp1),depthv)
%plot(imag(vp2),depthv,':')
plot(vimag,depthv,'o')
legend('data','interp on mag, phase','inpterp on real, imag')

autoArrangeFigures

figure
plot(phase,mag)
xlabel('phase')
ylabel('pressure (magnitude)')
grid on
hold on
plot(vphase,vmag,'x')
plot(angle(vcomp),abs(vcomp),'o')
legend('data','interp on mag, phase','inpterp on real, imag')

figure
plot(phase,real(p))
xlabel('phase')
ylabel('pressure (real)')
grid on
hold on
plot(vphase,real(vp),'x')
plot(angle(vcomp),vreal,'o')
legend('data','interp on mag, phase','inpterp on real, imag')

figure
plot(phase,imag(p))
xlabel('phase')
ylabel('pressure (imaginary)')
grid on
hold on
plot(vphase,imag(vp),'x')
plot(angle(vcomp),vimag,'o')
legend('data','interp on mag, phase','inpterp on real, imag')

autoArrangeFigures
