function setplotsize(scx,scy,sca)
% SETPLOTSIZE Set plot size.
%   Specify the plot dimensions in inches as (x,y,scale). The default
%   arguments are (10,7.5,1), corresponding to a plot 10" wide and 7.5"
%   tall.
switch nargin
    case 0
        scx=10;
        scy=7.5;
        sca=1;
    case 1        
        switch length(scx)
            case 1
                scy=scx;
                sca=1;
            case 2
                scy=scx(2);
                scx=scx(1);
                sca=1;
            case 3
                sca=scx(3);
                scy=scx(2);
                scx=scx(1);
        end
    case 2
        sca=1;
    otherwise
%         scx=6;
%         scy=4.6;
%         sca=1.5;
end
set(gcf,'units','inches');
set(gcf,'PaperType','usletter');
xoff=0.0;
yoff=0.65;

set(0,'units','inches')
dim=get(0,'screensize');
pos=get(0,'MonitorPositions');
nmon=size(pos,1);

if nmon > 1
    tgt_mon=1;
    xoff=xoff+pos(tgt_mon,1);
    yoff=yoff+pos(tgt_mon,2);
end

if (scx*sca+xoff) > dim(3)
    fprintf('adjusting plot size to fit screen\n')
    fprintf(' reducing sca from %f',sca)
    sca=(dim(3)-xoff)/(scx);
    fprintf(' to %f\n',sca)
end
if (scy*sca+yoff) > dim(4)
    fprintf('adjusting plot size to fit screen\n')
    fprintf(' reducing sca from %f',sca)
    sca=(dim(4)-yoff)/(scy);
    fprintf(' to %f\n',sca)
end

fprintf('dimensions are %f x %f with a scale factor of %f\n',scx,scy,sca)

set(gcf,'Position',[xoff,yoff,scx*sca,scy*sca]);
end