close all
clear variables

load_constants

rm=1:100;
TLm=-20*log10(rm/1);
figure
plot(rm,TLm)
ylabel('TL (ref 1 m)')
xlabel('range (m)')
grid on

ryd=rm*m2yd;
TLyd=-20*log10(ryd/1);

hold on
plot(ryd*yd2m,TLyd-dB_yd2m,'--')
legend('direct','converted')

figure
plot(ryd,TLyd)
ylabel('TL (ref 1 yd)')
xlabel('range (yd)')
grid on

hold on
plot(rm*m2yd,TLm-dB_m2yd,'--')
legend('direct','converted')

figure
plot(rm,TLm)
hold on
plot(ryd*yd2m,TLyd,'--')
grid on
xlabel('range (m)')
ylabel('TL')
legend('ref 1 m','ref 1 yd')

autoArrangeFigures

