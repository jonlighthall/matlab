%LOAD_CONSTANTS Constants for unit conversion
%% conversion constants
do_print=true;

%% multiplicitive constants
% equivalence definitions
ft2m=0.3048; % feet to meters (exact)
nmi2m=1852; % nautical miles to meters (exact)

% functional definitions
m2nmi=1./nmi2m; % meters to nautical miles
kt2ms=nmi2m/(60.*60); % knots to meters-per-second
ms2kt=1/kt2ms; % meters-per-second to knots

m2ft=1/ft2m; % meters to feet
m2yd=m2ft/3; % meters to yards
yd2m=1/m2yd; % yards to meters
kyd2m=(ft2m*3*1000); % kiloyards to meters

%% additive constants
dB_m2yd=20*log10(m2yd); % decibels, meter reference to yard reference
dB_yd2m=20*log10(yd2m); % decibels, yard reference to meter reference

% Note: these units are additive constants. For example, to convert from
% TL_ref_1m to TL_ref_1yd
% TL_ref_1m + dB_m2yd = TL_ref_1yd
 
%% printed output
if(do_print)
    % doubple precision settings
    dp=14;
    fmt=sprintf(' %%%d.%df',dp+3,dp); % floating point
   %fmt=sprintf(' %%%d.%de',dp+6,dp-1); % scientific
    fprintf(strcat('  nmi2m = ',fmt,'\n'),nmi2m);
    fprintf(strcat('  m2nmi = ',fmt,'\n'),m2nmi);
    fprintf(strcat('  kt2ms = ',fmt,'\n'),kt2ms);
    fprintf(strcat('  ms2kt = ',fmt,'\n'),ms2kt);
    fprintf('\n');
    fprintf(strcat('   ft2m = ',fmt,'\n'),ft2m);
    fprintf(strcat('   m2ft = ',fmt,'\n'),m2ft);
    fprintf(strcat('   m2yd = ',fmt,'\n'),m2yd);
    fprintf(strcat('   yd2m = ',fmt,'\n'),yd2m);
    fprintf(strcat('  kyd2m = ',fmt,'\n'),kyd2m);
    fprintf(strcat('dB_m2yd = ',fmt,'\n'),dB_m2yd);
    fprintf(strcat('dB_yd2m = ',fmt,'\n'),dB_yd2m);
end
