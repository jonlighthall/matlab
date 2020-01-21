close all

%% test colors

%grayscale
figure
colors='kw'; % names of colors to use
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap) 
title('grayscale')

% primary
figure
colors='bgr'; 
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap)
title('primary')

% secondary
figure
colors='bcgyrm'; % add cyan, yellow, magenta
[cmap]=buildcmap(colors); 
imshow(im), colorbar
colormap(cmap) 
title('secondary')

% tertiary
figure
colors='bzcaghyorsmv';
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
colors='kw'; % names of colors to use
len=length(colors);
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('grayscale, %d levels',n_contour))

% primary
figure
colors='bgr'; % number of colors to use
len=length(colors);
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('primary, %d levels',n_contour))

% secondary
figure
colors='bcgyrm'; % add cyan, magenta, black
len=length(colors);
levels=2; % gradient size between colors
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('secondary, %d levels',n_contour))

% tertiary
figure
colors='bzcaghyorsmv'; % add cyan, magenta, black
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
colors='kw'; % names of colors to use
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('grayscale, %d levels forced',n_contour))

% primary
figure
colors='bgr'; % number of colors to use
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('primary, %d levels forced',n_contour))

% secondary
figure
colors='bcgyrm'; % add cyan, magenta, black
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('secondary, %d levels forced',n_contour))

% tertiary
figure
colors='bzcaghyorsmv'; % add cyan, magenta, black
[cmap]=buildcmap(colors,n_contour,true); % add cyan, magenta, black
imshow(im), colorbar
colormap(cmap) 
title(sprintf('tertiary, %d levels forced',n_contour))

%% test force
n_contour=14;
% The number of levels is forced. A number of levels is chosen to conflict
% with the "natural" number of levels. For color inputs whose calculated
% gradient is less than the given number of levels, an additional color
% gradient is added to the top of the colorbar. The added color is the
% complementary color of the highest colorbar value.

%grayscale
figure
colors='kw'; % names of colors to use
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('grayscale, %d levels forced',n_contour))

% primary
figure
colors='bgr'; % number of colors to use
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('primary, %d levels forced',n_contour))

% secondary
figure
colors='bcgyrm'; % add cyan, magenta, black
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title(sprintf('secondary, %d levels forced',n_contour))

% tertiary
figure
colors='bzcaghyorsmv'; % add cyan, magenta, black
[cmap]=buildcmap(colors,n_contour,true); % add cyan, magenta, black
imshow(im), colorbar
colormap(cmap) 
title(sprintf('tertiary, %d levels forced',n_contour))

autoArrangeFigures