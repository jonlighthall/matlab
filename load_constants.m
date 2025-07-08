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

fprintf('Loading conversions constants... ')

%% multiplicitive constants

% The naming convention for the "variables" is as follows: <unit1>2<unit2> is the
%   conversion constant from unit1 to unit2 with units of [unit2/unit1]. The
%   constants are applied as multiplicitive coefficients as follows:

%   <value>[unit1] * <unit1>2<unit2>[unit2/unit1] = <value>[unit2]

% For example, to convert from feet to meters, the constant ft2m is used, which
%   uses the definition of the length of the "international foot":
%
%   1ft = 0.3048m.
%
%   Therefore, with units, the conversion constant ft2m = 0.3048 [m/ft].

%-------------------------------------------------------
% Primary definitions (exact)
ft2m=0.3048;   % feet to meters            = 0.3048
nmi2m=1852;    % nautical miles to meters  = 1852

%-------------------------------------------------------
% Derived definitions (exact)
% yards
yd2m=ft2m*3;       % yards to meters       = 0.914
kyd2m=(yd2m*1000); % kiloyards to meters   = 914.4

% statute miles
mi2m=ft2m*5280;  % statute miles to meters = 1609.344
mi2km=mi2m/1000; % statute miles to km     = 1.609344
mph2ms=mi2m/3600; % miles-per-hour to
%                        meters-per-second = 0.44704

% nautical miles
nmi2km=nmi2m/1000; % nautical miles to km  = 1.852

%-------------------------------------------------------
% inverse relations (approximate)
% meters
m2ft =1/ft2m;  % meters to feet            ~ 3.2808
m2yd =1/yd2m;  % meters to yards           ~ 1.0936
m2kyd=1/kyd2m; % meters to kiloyards       ~ 0.0011
m2mi =1/mi2m;  % meters to statute miles   ~ 6.2137e-4
m2nmi=1/nmi2m; % meters to nautical miles  ~ 5.3996e-4

% feet
ft2nmi=ft2m*m2nmi; % feet to nautical mile ~ 1.6458e-4
ft2mi=ft2m*m2mi;   % feet to statute mile  ~ 1.8939e-4

% kilometers
km2mi = 1/mi2km; % kilometers to statute miles ~ 0.6214
km2nmi=1/nmi2km; % kilometers to nautical miles ~ 0.53996

% nautical miles
nmi2ft=nmi2m*m2ft; % nautical mile to feet ~ 6.0761e+3

% speed
% knots (nautical miles per hour)
kt2ms=nmi2m/(60*60); % knots to meters-per-second ~ 0.5144
kt2mph=nmi2m/mi2m; % knots to miles-per-hour ~ 1.1508

% meters-per-second
ms2kt=1/kt2ms; % meters-per-second to knots ~ 1.9438
ms2mph=1/mph2ms; % meters-per-second to miles-per-hour ~ 2.2369

% miles-per-hour
mph2kt=1/kt2mph;
mph2kph=mi2km;

%% additive constants
dB_m2yd=20*log10(m2yd); % decibels, meter reference to yard reference
dB_yd2m=20*log10(yd2m); % decibels, yard reference to meter reference

% Note: Transmission loss is a negative number. The negative sign is
% implied. Therefore, these conversion units are additive constants.  For
% example:
%
% to convert from TL_ref_1m to TL_ref_1yd
% TL_ref_1m + dB_m2yd = TL_ref_1yd (always 0.773 dB more TL)
% TL_ref_1yd + dB_yd2m = TL_ref_1m (always 0.773 dB less TL)

fprintf('done.\n');

%% printed output
if(lc_do_print)
    fprintf('%s: ',func);
    % doubple precision settings
    lc_dp=12;
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

clear lc_do_print lc_dp lc_fmt stack func