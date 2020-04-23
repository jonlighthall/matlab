% set plot size
%if default
%    scx=6;
%    scy=4.6;
%    sca=1.5;
%else
    scx=10;
    scy=7.5;
    sca=1;
%end
set(gcf,'units','inches');
set(gcf,'PaperType','usletter');
set(gcf,'Position',[0.05, 0.3, scx*sca, scy*sca]);