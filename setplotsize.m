function setplotsize(scx,scy,sca)
% set plot size
switch nargin
    case 0
%if default
%    scx=6;
%    scy=4.6;
%    sca=1.5;
%else
    scx=10;
    scy=7.5;
    sca=1;
%end       
    case 1
    case 2
        sca=1;
end    
set(gcf,'units','inches');
set(gcf,'PaperType','usletter');
set(gcf,'Position',[0.05, 0.3, scx*sca, scy*sca]);
xoff=0.0;
yoff=0.65;
set(gcf,'Position',[xoff,yoff,scx*sca,scy*sca]);
end