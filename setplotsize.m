function setplotsize(scx,scy,sca)
% set plot size
switch nargin
    case 0
        scx=10;
        scy=7.5;
        sca=1;
    case 1
        scy=scx;
        sca=1;
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

set(gcf,'Position',[xoff,yoff,scx*sca,scy*sca]);
end