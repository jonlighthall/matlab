close all
clear variables

load_constants


% define metric units
rm=1:100;
TLm=r2tl(rm);

% define american units
ryd=rm*m2yd;
TLyd=r2tl(ryd);

% define referece tl
r_ref=[1 10 100];
TL_ref=r2tl(r_ref);

%% plot metric
figure
plot(rm,TLm)
xlabel('range (m)')
ylabel('TL (dB ref 1 m)')
config_plot
plot(ryd*yd2m,TLyd+dB_yd2m,'--')
legend('direct','converted')
title('Spherical Spreading TL - metric')
plot(r_ref,TL_ref,'o','DisplayName','reference')

%% plot imperial
figure
plot(ryd,TLyd)
xlabel('range (yd)')
ylabel('TL (dB ref 1 yd)')
config_plot
plot(rm*m2yd,TLm+dB_m2yd,'--')
legend('direct','converted')
title('Spherical Spreading TL - USCS')
plot(r_ref,TL_ref,'o','DisplayName','reference')

%% plot both
figure
plot(rm,TLm)
xlabel('range (m)')
ylabel('TL (dB)')
config_plot
plot(ryd*yd2m,TLyd,'--')

legend('ref 1 m','ref 1 yd')
title('Spherical Spreading TL')
plot(r_ref,TL_ref,'o','DisplayName','ref 1m')
plot(r_ref*yd2m,TL_ref,'o','DisplayName','ref 1yd')

autoArrangeFigures

function config_plot ()
grid on
axis ij
hold on
xlim([0 110])
ylim([-1 45])
end

function [tl] = r2tl (range)
tl=20*log10(range/1);
end