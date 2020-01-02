function timestamp()
%TIMESTAMP Add timestamp to bottom of figure
%   Detailed explanation goes here
% numerical
%datestring=datestr(now,29); %ISO 8601
datestring=datestr(now,'yyyy-dd-mm HH:MM');
%datestring=datestr(now,31);

% natural
%datestring=datestr(now,'mmm dd, yyyy');
%datestring=datestr(now,'mmm dd, yyyy HH:MM');
%datestring=datestr(now,'mmm dd, yyyy HH:MM:SS');

delete(findall(gcf,'type','annotation'))
annotation('textbox',[0, 0.03, 0, 0], 'String', datestring,...
    'FitBoxToText','on','LineStyle','none','FontSize',8)
end

