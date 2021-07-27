close all
im=imread('cameraman.tif');

mx_dim=128;
dim=size(im);

lx=size(1);
ly=size(2);

 nx=max(floor(lx/mx_dim),1);
 ny=max(floor(ly/mx_dim),1);

 imp=im(1:nx:lx,1:ny:ly);

%% define maps
% maps=["kw";"bgr";"cym";"zahosv"]; % subset only
% maps=["kw";"bgr";"bcgyr";"bzcaghyor"]; % blue-to-red
%maps=["kw";"bgr";"bcgyrm";"bzcaghyorsmv"]; % full color sets
% maps=["wk";"wgbr";"wygbr";"wyhgaczbvmsr"]; % demo
% maps=["wk";"wbgr";"wbcgyr";"wvbzcaghyor"]; % white-to-rainbow
% maps=["kw";"kbrgw";"kbmrygcw";"kbvmsroyhgacw"]; % black-to-white
% maps=["wk";"wgrbk";"wcgyrmbk";"wcaghyorsmvbk"]; % white-to-black
 maps=["wk";"wbgrk";"wbcgyrmk";"wbzcaghyorsmvk"]; % b/w sandwhich

%% test force
% The number of levels is forced. For color inputs whose length is greater
% than the number of levels, the colors are truncated.
n_contour=128;
force=false;

%grayscale
figure
colors=convertStringsToChars(maps(1));
[cmap]=buildcmap(colors,n_contour,force); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('grayscale, %d levels forced',length(cmap)))

% primary
figure
colors=convertStringsToChars(maps(2));
[cmap]=buildcmap(colors,n_contour,force); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('primary, %d levels forced',length(cmap)))

% secondary
figure
colors=convertStringsToChars(maps(3));
[cmap]=buildcmap(colors,n_contour,force); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('secondary, %d levels forced',length(cmap)))

% tertiary
figure
colors=convertStringsToChars(maps(4));
[cmap]=buildcmap(colors,n_contour,force); % add cyan, magenta, black
imshow(im), colorbar
colormap(cmap) 
title(sprintf('tertiary, %d levels forced',length(cmap)))

autoArrangeFigures