close all

% Example:
[cmap]=buildcmap('wygbr');
%try the output cmap:
im=imread('cameraman.tif');
imshow(im), colorbar
colormap(cmap) %will use the output colormap

% primary
figure
colors='wgbr'; % number of colors to use
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap) %will use the output colormap

% secondary
figure
colors='wygcbmr'; % add cyan, magenta, black
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap) %will use the output colormap

% tertiary
figure
colors='wyhgaczbvmsro'; % add cyan, magenta, black
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap) %will use the output colormap

figure
colors='kw'; % number of colors to use
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap) %will use the output colormap

% primary
figure
colors='wbgr'; % number of colors to use
len=length(colors);
levels=2; % gradient size between colors
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) %will use the output colormap

% secondary
figure
colors='wbcgyrm'; % add cyan, magenta, black
len=length(colors);
levels=2; % gradient size between colors
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) %will use the output colormap

% tertiary
figure
%colors='wroyhgaczbvmsk'; % number of colors to use
colors='wbzcaghyorsmv'; % add cyan, magenta, black
len=length(colors);
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour,true); % add cyan, magenta, black
imshow(im), colorbar
colormap(cmap) %will use the output colormap

autoArrangeFigures