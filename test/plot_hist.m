%PLOT_HIST
% requries the Statistics and Machine Learning Toolbox

close all
clear variables

%% plot random distribution with projections
hdata(:,1)=normrnd(50,15,[1,10000]);
hdata(:,2)=normrnd(30,5,[1,10000]);

% define bins
xnbins=100;
xmin=0;
xmax=100;
xbinwidth=(xmax-xmin)/(xnbins);
ynbins=100;
ymin=0;
ymax=100;
ybinwidth=(ymax-ymin)/(ynbins);

figure
hist3(hdata,'CDataMode','auto','FaceColor','interp','Edges'...
    ,{xmin:xbinwidth:xmax ymin:ybinwidth:ymax},'LineStyle','none')
view(2)

% mimic ROOT colormap
cmjet=colormap(jet);
mymap=[1 1 1;cmjet];
colormap(mymap);
colorbar

% x-projection
figure
histogram(hdata(:,1))
histfit(hdata(:,1))
grid on

% y-projection
figure
histogram(hdata(:,2))
histfit(hdata(:,2))
grid on

%% plot simple histogram
figure
hfill=zeros(3);
hfill(1,1)=1;
hfill(3,3)=3;
hfill(1,3)=5;
hfill(3,1)=10;

x=[0,1,2];
x=x*10/3; % edges
x=x+10/6; % centers
y=[0,1,2];
y=y*10/3;
y=y+10/6;

pjx=[1 3 3 3 1 1 1 1 1 3 3 3 3 3 3 3 3 3 3];
pjy=[1 3 3 3 3 3 3 3 3 1 1 1 1 1 1 1 1 1 1];
pjx=(pjx-1)*10/3+10/6;
pjy=(pjy-1)*10/3+10/6;


mkhist2=[pjx' pjy'];
hist3(mkhist2,'Ctrs',{x y},'CDataMode','auto','FaceColor','interp',...
    'LineStyle','none')
view(2)

cmjet=colormap(jet);
mymap=[1 1 1;cmjet];
colormap(mymap);
colorbar

autoArrangeFigures

%% plot data from file
if exist('hist.out','file')==2
    load hist.out
    hx=hist(:,1);
    hy=hist(:,2);
    hz=hist(:,3);
    hl=length(hx);
    hh=zeros(length(hx),length(hy));
end

A=hist3(mkhist2,'Ctrs',{x y});