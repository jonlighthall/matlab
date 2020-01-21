close all
im=imread('cameraman.tif');

%% define maps
%% define maps
% maps=["kw";"bgr";"cym";"zahosv"]; % subset only
% maps=["kw";"bgr";"bcgyr";"bzcaghyor"]; % blue-to-red
maps=["kw";"bgr";"bcgyrm";"bzcaghyorsmv"]; % full color sets
% maps=["wk";"wgbr";"wygbr";"wyhgaczbvmsr"]; % demo
% maps=["wk";"wbgr";"wbcgyr";"wvbzcaghyor"]; % white-to-rainbow
% maps=["kw";"kbrgw";"kbmrygcw";"kbvmsroyhgacw"]; % black-to-white
% maps=["wk";"wgrbk";"wcgyrmbk";"wcaghyorsmvbk"]; % white-to-black
% maps=["wk";"wbgrk";"wbcgyrmk";"wbzcaghyorsmvk"]; % b/w sandwhich

%% test colors

%grayscale
figure
colors=convertStringsToChars(maps(1));
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap) 
title('grayscale')

% primary
figure
colors=convertStringsToChars(maps(2));
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap)
title('primary')

% secondary
figure
colors=convertStringsToChars(maps(3));
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap) 
title('secondary')

% tertiary
figure
colors=convertStringsToChars(maps(4));
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap) 
title('tertiary')

%% test levels
% for each example, the "natural" number of levels is calculated for a
% given gradient size per color
levels=2; % gradient size between colors

%grayscale
figure
colors=convertStringsToChars(maps(1));
len=length(colors);
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('grayscale, %d levels',n_contour))

% primary
figure
colors=convertStringsToChars(maps(2));
len=length(colors);
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('primary, %d levels',n_contour))

% secondary
figure
colors=convertStringsToChars(maps(3));
len=length(colors);
levels=2; % gradient size between colors
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('secondary, %d levels',n_contour))

% tertiary
figure
colors=convertStringsToChars(maps(4));
len=length(colors);
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); % add cyan, magenta, black
imshow(im), colorbar
colormap(cmap) 
title(sprintf('tertiary, %d levels',n_contour))

%% test force
% The number of levels is forced. For color inputs whose length is greater
% than the number of levels, the colors are truncated.
n_contour=3;

%grayscale
figure
colors=convertStringsToChars(maps(1));
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('grayscale, %d levels forced',n_contour))

% primary
figure
colors=convertStringsToChars(maps(2));
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('primary, %d levels forced',n_contour))

% secondary
figure
colors=convertStringsToChars(maps(3));
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('secondary, %d levels forced',n_contour))

% tertiary
figure
colors=convertStringsToChars(maps(4));
[cmap]=buildcmap(colors,n_contour,true); % add cyan, magenta, black
imshow(im), colorbar
colormap(cmap) 
title(sprintf('tertiary, %d levels forced',n_contour))

%% test force
n_contour=140;
% The number of levels is forced. A number of levels is chosen to conflict
% with the "natural" number of levels. For color inputs whose calculated
% gradient is less than the given number of levels, an additional color
% gradient is added to the top of the colorbar. The added color is the
% complementary color of the highest colorbar value.

%grayscale
figure
colors=convertStringsToChars(maps(1));
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('grayscale, %d levels forced',n_contour))

% primary
figure
colors=convertStringsToChars(maps(2));
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('primary, %d levels forced',n_contour))

% secondary
figure
colors=convertStringsToChars(maps(3));
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('secondary, %d levels forced',n_contour))

% tertiary
figure
colors=convertStringsToChars(maps(4));
[cmap]=buildcmap(colors,n_contour,true); % add cyan, magenta, black
imshow(im), colorbar
colormap(cmap) 
title(sprintf('tertiary, %d levels forced',n_contour))

autoArrangeFigures