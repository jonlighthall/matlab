function autoArrangeFigures(monitor_id)
stack=dbstack;
func=stack(1).name;
%fprintf('function name is %s and stack length is %d\n',func,length(stack))
% for i=1:length(stack)
%     fprintf('%d: %s\n',i,stack(i).name)
% end

%AUTOARRANGEFIGURES Arranges figures in numerical order.
%
%   INPUT  : target monitor (optional)
%   OUTPUT : none
%
%   Funciton: The number of figues is used to determing a plotting grid. A
%   uniform figure size is calculated to fill the given monitor. Figues are
%   sorted in numerical order.
%
%   Settings:
%   Set default monitor and system-dependent task bar size.
%
%   Revisions:
%   2019.04.23 JCL, NRL, USA use calculated grid
%   2017.01.20 use monitor id (Adam Danz's idea)
%   2014.12.13 leejaejun, Koreatech, Korea Republic, jaejun0201@gmail.com

%% count and sort figues
figs=findobj('type','figure');
n_fig=size(figs,1);
if n_fig <= 0
    fprintf('%s: no figures to arrange\n',func);
    return
else
    [~,idx]=sort([figs.Number]);
    figs=figs(idx);
end

%% calculate usable display size
set(0,'units','pixels')
screen_sz = get(0,'MonitorPositions');
% select target montior
[n_monitors,~]=size(screen_sz);
if nargin < 1
    % define defualt monitor
    if n_monitors > 1
        monitor_id = 2;
    else
        monitor_id = 1;
    end
else
    % check user input
    if monitor_id>n_monitors
        monitor_id=n_monitors;
    end
end
screen_sz = screen_sz(monitor_id, :);
% set offset for taskbar, etc
taskbar_offset = [-8 -7 13 54]; % left right top bottom
scn_w = screen_sz(3) - taskbar_offset(1) - taskbar_offset(2);
scn_h = screen_sz(4) - taskbar_offset(3) - taskbar_offset(4);
scn_w_begin = screen_sz(1) + taskbar_offset(1);
scn_h_begin = screen_sz(2) + taskbar_offset(4);

%% calculate grid size
nh=floor(sqrt(n_fig));
nw=ceil(n_fig/nh);

%% calcuate figure size
fig_width = scn_w/nw;
fig_height = scn_h/nh;

fig_cnt = 1;
%% loop over grid and plot figures
for i=1:1:nh
    for k=1:1:nw
        if fig_cnt>n_fig
            return
        end
        fig_pos = [scn_w_begin+fig_width*(k-1) ...
            scn_h_begin+scn_h-fig_height*i ...
            fig_width ...
            fig_height];
        set(figs(fig_cnt),'units','pixels','OuterPosition',fig_pos);
        figure(figs(fig_cnt)) % bring figure to foreground
        fig_cnt = fig_cnt + 1;
    end
end
end