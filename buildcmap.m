function [cmap]=buildcmap(colors,levels,force)
% [cmap]=buildcmap(colors)
%
% This function can be used to build your own custom colormaps. Imagine if
% you want to display rainfall distribution map. You want a colormap which
% ideally brings rainfall in mind, which is not achiveved by colormaps such
% as winter, cool or jet and such. A gradient of white to blue will do the
% task, but you might also use a more complex gradient (such as
% white+blue+red or colors='wbr'). This function can be use to build any
% colormap using main colors rgbcmyk. In image processing, w (white) can be
% used as the first color so that in the output, the background (usually
% with 0 values) appears white. In the example of rainfall map, 'wb' will
% produce a rainfall density map where the background (if its DN values are
% 0) will appear as white.
%
% Inputs:
%  colors: string (char) of color codes, any sequence of rgbcmywk
%  representing different colors (such as 'b' for blue) is acceptable. If a
%  gradient of white to blue is needed, colors would be 'wb'; a rainbow of
%  white+blue+red+green would be 'wbrg'.
%
%  levels: integer total number of levels in the overall color gradient.
%  The number of levels calulated will be equal to colors+(colors-1)*n
%  where n is the number of levels between each color such that the total
%  number of levels is less than or equal to the input.
%
%  force: force the number of output levels to match the number specified.
%  Extra levels will be added in a gradient to black.
%
% Example:
% [cmap]=buildcmap('wygbr');
% %try the output cmap:
% im=imread('cameraman.tif');
% imshow(im), colorbar
% colormap(cmap) %will use the output colormap
%
% First version: 14 Feb. 2013
% sohrabinia.m@gmail.com
%
% Levels added by JCL 17 Jan. 2020
%--------------------------------------------------------------------------

if nargin<3
    force=false;
    if nargin<2
        levels=256;
        if nargin<1
            colors='wrgbcmyk';
        end
    end
end

if ~ischar(colors)
    error(['Error! colors must be a variable of type char with '...
        'color-names, such as ''r'', ''g'', etc., '...
        'type ''help buildcmap'' for more info']);
end

ncolors=length(colors)-1;


bins=max(floor((levels-1)/ncolors),1);
diff1=(levels-1)-bins*ncolors;

vec=zeros(bins*ncolors,3);

switch colors(1)
    % grayscale
    case 'k' % black
        vec(1,:)=[0 0 0];
    case 'w' % white
        vec(1,:)=1;

    % primary
    case 'r' % red
        vec(1,:)=[1 0 0];
    case 'g' % green
        vec(1,:)=[0 1 0];
    case 'b' % blue
        vec(1,:)=[0 0 1];

    % secondary
    case 'y' % yellow
        vec(1,:)=[1 1 0];
    case 'c' % cyan
        vec(1,:)=[0 1 1];
    case 'm' % magenta
        vec(1,:)=[1 0 1];

   % tertiary
    case 'o' % orange
        vec(1,:)=[1 .5 0];  
    case 'h' % chartreuse 
        vec(1,:)=[0.5 1 0];
    case 'a' % spring green
        vec(1,:)=[0 1 0.5];
    case 'z' % azure
        vec(1,:)=[0 0.5 1];
    case 'v' % violet
        vec(1,:)=[0.5 0 1];
    case 's' % rose
        vec(1,:)=[1 0 0.5];
end


for i=1:ncolors
 beG=(i-1)*bins+1;
 enD=i*bins+1; %beG,enD
 switch colors(i+1)
     case 'w'
         vec(beG:enD,1)=linspace(vec(beG,1),1,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),1,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),1,bins+1)';%colors(i+1),beG,enD,
     case 'r'
         vec(beG:enD,1)=linspace(vec(beG,1),1,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),0,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),0,bins+1)';%colors(i+1),beG,enD
     case 'g'
         vec(beG:enD,1)=linspace(vec(beG,1),0,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),1,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),0,bins+1)';%colors(i+1),beG,enD
     case 'b'         
         vec(beG:enD,1)=linspace(vec(beG,1),0,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),0,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),1,bins+1)';%colors(i+1),beG,enD
     case 'c'
         vec(beG:enD,1)=linspace(vec(beG,1),0,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),1,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),1,bins+1)';%colors(i+1),beG,enD
     case 'm'
         vec(beG:enD,1)=linspace(vec(beG,1),1,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),0,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),1,bins+1)';
     case 'y'
         vec(beG:enD,1)=linspace(vec(beG,1),1,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),1,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),0,bins+1)';
     case 'k'
         vec(beG:enD,1)=linspace(vec(beG,1),0,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),0,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),0,bins+1)';
     case 'o'
         vec(beG:enD,1)=linspace(vec(beG,1),1,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),0.5,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),0,bins+1)';
     case 'h'
         vec(beG:enD,1)=linspace(vec(beG,1),0.5,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),1,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),0,bins+1)';
     case 'a'
         vec(beG:enD,1)=linspace(vec(beG,1),0,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),1,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),0.5,bins+1)';
     case 'z'
         vec(beG:enD,1)=linspace(vec(beG,1),0,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),0.5,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),1,bins+1)';
     case 'v'
         vec(beG:enD,1)=linspace(vec(beG,1),0.5,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),0,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),1,bins+1)';
     case 's'
         vec(beG:enD,1)=linspace(vec(beG,1),1,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),0,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),0.5,bins+1)';
 end
end

if diff1 && force
    beG=bins*ncolors+1;
    enD=levels;
    bins=diff1;
         vec(beG:enD,1)=linspace(vec(beG,1),0,bins+1)';
         vec(beG:enD,2)=linspace(vec(beG,2),0,bins+1)';
         vec(beG:enD,3)=linspace(vec(beG,3),0,bins+1)';
end

cmap=vec();
end %end of buildcmap
