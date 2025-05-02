tl=40:130;
w=tlw(tl);
figure
plot(tl,w,'LineWidth',2)
grid on
dy=.1;
ylim([0-dy 1+dy])
xlim([min(tl) max(tl)])
xlabel('TL (dB)')
ylabel('weight')
title('TL weighting function')
hold on
xline(60)
xline(110)