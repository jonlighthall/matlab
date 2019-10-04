function autoArrangeFigures(monitor_id)
% INPUT  : target monitor (optional)
% OUTPUT : none
%
% get every figures that are opened now and arrange them.
%
% autoArrangeFigures selects automatically Monitor1.
% If you are dual(or more than that) monitor user, I recommend to set wide
% monitor as Monitor1.
%
% Notes
% 2019.04.23 use grid calc from https://github.com/jonlighthall/root/blob/master/fit.cc#L798
% JCL, NRL, USA
% 
%  + 2017.1.20 use monitor id(Adam Danz's idea)
%
% leejaejun, Koreatech, Korea Republic, 2014.12.13
% jaejun0201@gmail.com

if nargin < 1
    monitor_id = 1;
end

task_bar_offset = [0 20];

%%
figHandle = sortFigureHandles(findobj('Type','figure'));
n_fig = size(figHandle,1);
if n_fig <= 0
    warning('figures are not found');
    return
end

% calculate usable display size
screen_sz = get(0,'MonitorPositions');
screen_sz = screen_sz(monitor_id, :);
scn_w = screen_sz(3) - task_bar_offset(1);
scn_h = screen_sz(4) - task_bar_offset(2);
scn_w_begin = screen_sz(1) + task_bar_offset(1);
scn_h_begin = screen_sz(2) + task_bar_offset(2) - 10;

% calculate grid size
nh=floor(sqrt(n_fig));
nw=ceil(n_fig/nh);

fig_width = scn_w/nw;
fig_height = scn_h/nh;

fig_cnt = 1;
for i=1:1:nh
    for k=1:1:nw
        if fig_cnt>n_fig
            return
        end
        fig_pos = [scn_w_begin+fig_width*(k-1) ...
            scn_h_begin+scn_h-fig_height*i ...
            fig_width ...
            fig_height];
        set(figHandle(fig_cnt),'units','pixels','OuterPosition',fig_pos);
        fig_cnt = fig_cnt + 1;
    end
end

end

function figSorted = sortFigureHandles(figs)
    [~, idx] = sort([figs.Number]);
    figSorted = figs(idx);
end
