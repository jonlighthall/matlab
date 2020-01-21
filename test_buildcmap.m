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
levels=2; % gradient size between colors

%grayscale
figure
colors='kw'; % names of colors to use
len=length(colors);
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); 
imshow(im), colorbar
colormap(cmap) 
title('grayscale')

% primary
figure
colors='bgr'; % number of colors to use
len=length(colors);
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); 
imshow(im), colorbar
colormap(cmap) 

% secondary
figure
colors='bcgyrm'; % add cyan, magenta, black
len=length(colors);
levels=2; % gradient size between colors
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); 
imshow(im), colorbar
colormap(cmap) 

% tertiary
figure
colors='bzcaghyorsmv'; % add cyan, magenta, black
len=length(colors);
n_contour = len+(len-1)*levels;
[cmap]=buildcmap(colors,n_contour); % add cyan, magenta, black
imshow(im), colorbar
colormap(cmap) 

%% test force
n_contour=14;

%grayscale
figure
colors='kw'; % names of colors to use
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 
title('grayscale')

% primary
figure
colors='bgr'; % number of colors to use
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 

% secondary
figure
colors='bcgyrm'; % add cyan, magenta, black
[cmap]=buildcmap(colors,n_contour,true); 
imshow(im), colorbar
colormap(cmap) 

% tertiary
figure
colors='bzcaghyorsmv'; % add cyan, magenta, black
[cmap]=buildcmap(colors,n_contour,true); % add cyan, magenta, black
imshow(im), colorbar
colormap(cmap) 

autoArrangeFigures