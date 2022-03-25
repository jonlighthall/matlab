%LOAD_CONSTANTS Constants for unit conversion
%% conversion constants
stack=dbstack;
func=stack(1).name;

if exist('lc_do_print','var') || exist('lc_dp','var') || exist('lc_fmt','var')
    warning('%s: existing variable names will be overwritten\n',func)
end

% only print constants if called directly
if length(stack)==1
    lc_do_print=true;
else
    lc_do_print=false;
end

%% multiplicitive constants
% equivalence definitions
global ft2m
ft2m=0.3048; % feet to meters (exact)
global nmi2m
nmi2m=1852; % nautical miles to meters (exact)
global mi2m
%mi2m=1609.344; % statute miles to meters (exact)
mi2m=ft2m*5280; % statute miles to meters

% functional definitions
% speed
m2nmi=1/nmi2m; % meters to nautical miles
kt2ms=nmi2m/(60*60); % knots (nautical miles per hour) to meters-per-second
ms2kt=1/kt2ms; % meters-per-second to knots
kt2mph=nmi2m/mi2m; % knots to miles-per-hour

% distance
nmi2km=nmi2m/1000; % nautical miles to kilometers
m2ft=1/ft2m; % meters to feet
m2yd=m2ft/3; % meters to yards
yd2m=1/m2yd; % yards to meters
kyd2m=(yd2m*1000); % kiloyards to meters

%% additive constants
dB_m2yd=20*log10(m2yd); % decibels, meter reference to yard reference
dB_yd2m=20*log10(yd2m); % decibels, yard reference to meter reference

% Note: these units are additive constants. For example, to convert from
% TL_ref_1m to TL_ref_1yd
% TL_ref_1m + dB_m2yd = TL_ref_1yd
 
%% printed output
if(lc_do_print)
    fprintf('%s: ',func);
    % doubple precision settings
    lc_dp=14;
    fprintf('printed to %d decimal places\n',lc_dp);
    lc_fmt=sprintf(' %%%d.%df',lc_dp+3,lc_dp); % floating point
   %fmt=sprintf(' %%%d.%de',dp+6,dp-1); % scientific
    fprintf(strcat('  nmi2m = ',lc_fmt,'\n'),nmi2m);
    fprintf(strcat('   mi2m = ',lc_fmt,'\n'),mi2m);
    fprintf('\n');
    fprintf(strcat('  m2nmi = ',lc_fmt,'\n'),m2nmi);
    fprintf(strcat('  kt2ms = ',lc_fmt,'\n'),kt2ms);
    fprintf(strcat('  ms2kt = ',lc_fmt,'\n'),ms2kt);
    fprintf('\n');
    fprintf(strcat('   ft2m = ',lc_fmt,'\n'),ft2m);
    fprintf(strcat('   m2ft = ',lc_fmt,'\n'),m2ft);
    fprintf(strcat('   m2yd = ',lc_fmt,'\n'),m2yd);
    fprintf(strcat('   yd2m = ',lc_fmt,'\n'),yd2m);
    fprintf(strcat('  kyd2m = ',lc_fmt,'\n'),kyd2m);
    fprintf('\n');
    fprintf(strcat('dB_m2yd = ',lc_fmt,'\n'),dB_m2yd);
    fprintf(strcat('dB_yd2m = ',lc_fmt,'\n'),dB_yd2m);
end

clear lc_do_print lc_dp lc_fmt stack 
