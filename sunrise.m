function varargout=sunrise(varargin)
%SUNRISE Computes sunset and sunrise time.
%	SUNRISE(LAT,LON,ALT,TZ) displays time of sunrise and sunset at
%	location latitude LAT (decimal degrees, positive towards North),
%	longitude LON (decimal degrees, positive towards East), altitude ALT
%	(in meters above sea level) for today. Time zone TZ (in hour) is
%	recommanded but optional (default is the computer system time zone).
%
%	SUNRISE(LAT,LON,ALT,TZ,DATE) computes sunrise and sunset time for
%	date DATE (in any datenum compatible format). DATE can be scalar,
%	vector or matrix of dates (strings or datenum).
%
%	SUNRISE by itself displays time of sunrise and sunset at your
%	approximate location (needs Java activated and internet connection).
%
%	[SRISE,SSET,NOON]=SUNRISE(...) returns time of sunrise, sunset and noon
%	in datenum format. To get only hours, try datestr(srise,'HH:MM').
%
%	DAYLENGTH=SUNRISE(...) returns the day length of light expressed in
%	fraction of day. Multiply by 24 to get hours.
%
%	Examples:
%		>> sunrise(37.71,15.03,2031,2,'2017-07-17')
%		Sunrise: 17-Jul-2017 05:43:10 +02
%		Sunset:  17-Jul-2017 20:30:39 +02
%		Day length: 14h 47mn 30s
%
%		>> sunrise
%		Location: -8.65∞N, 115.2167∞E, 0m
%		Sunrise: 16-Oct-2017 05:57:07 +08
%		Sunset:  16-Oct-2017 18:14:31 +08
%		Day length: 12h 17mn 24s
%
%		Plot sunrise and sunset time variation for the year:
%		days = datenum(2017,1,1:365);
%		[srise,sset,noon]=sunrise(48.8,2.3,0,2,days);
%		plot(days,rem([srise;sset;noon]',1)*24,'linewidth',4)
%		datetick('x')
%
%	Reference:
%	    https://en.wikipedia.org/wiki/Sunrise_equation
%
%	Copyright (c) 2019, Fran√ßois Beauducel, covered by BSD License.
%	All rights reserved.
%
%	Redistribution and use in source and binary forms, with or without
%	modification, are permitted provided that the following conditions are
%	met:
%
%	   * Redistributions of source code must retain the above copyright
%	     notice, this list of conditions and the following disclaimer.
%	   * Redistributions in binary form must reproduce the above copyright
%	     notice, this list of conditions and the following disclaimer in
%	     the documentation and/or other materials provided with the
%	     distribution
%
%	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
%	IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
%	TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
%	PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
%	OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
%	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
%	LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
%	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
%	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
%	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
%	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

%% get date
if nargin < 5
    fprintf('no date specifed\n\tusing today\n')
    dte = floor(now);
    fprintf('\tdate is %d\n',dte)
    fprintf('\tdate is %s\n',datestr(dte))
else
    dte = floor(datenum(varargin{5}));
end

%% get time zone
if nargin < 4 || isempty(varargin{4})
    fprintf('no time zone specifed\n\tusing...')
    if exist('java.util.Date','class')
        tz = -java.util.Date().getTimezoneOffset/60;
        fprintf('java\n')
    else
        tz = 0;
        fprintf('zulu\n')
    end
    fprintf('\ttime zone is UTC%+d\n',tz)
elseif nargin > 3
    tz = varargin{4};
end

%% get altitude
if nargin < 3
    alt = 0;
else
    alt = varargin{3};
end

%% try to guess the location...
if nargin < 2 || isempty(varargin{1}) || isempty(varargin{2})
    fprintf('no location specified\n\tguessing location based on IP address\n')
    %api = 'http://freegeoip.net/json/';
    api = 'http://ip-api.com/json';
    if exist('webread','file')
        S = webread(api);
        if isfield(S,'lat') && isfield(S,'lon')
            lat = S.lat;
            lon = S.lon;
        else
            lat = NaN;
            lon = NaN;
        end
    else
        % for Matlab release < 2014b
        s = urlread(api);
        x = textscan(regexprep(s,'[{}"]',''),'%s','delimiter',',');
        lat = jsd(x{1},'lat:');
        lon = jsd(x{1},'lon:');
        fprintf('\tlocation is is %f, %f\n',lat,lon)
    end
    if isnan(lat) || isnan(lon)
        error('Cannot determine automatic location... sorry!')
    end
    autoloc = 1;
else
    lat = varargin{1};
    lon = varargin{2};
    autoloc = 0;
end

%% look up altitude
if nargin < 3 && alt ==0
    fprintf('no altitude specified\n')
    fprintf('\tlooking up elevation using... ')
    try
        % requires Antenna Toolbox
        loc= txsite('Latitude',lat,'Longitude',lon);
        % returns ground or building height in meters
        alt = elevation(loc);        
        disp('MATLAB txsite')
        fprintf('\t\televation is %.1f m\n',alt)
        try
            % requires Google API key
            load api_key.mat API_key
            fprintf('\tGoogle API\n')
            alt2 = getElevations(lat,lon,'key',API_key);
            fprintf('\t\tground elevation is %.1f m\n',alt2)
            dalt=alt-alt2;
            if dalt>0
                fprintf('\tinferred building height is %.1f m or %.1f ft\n',dalt,dalt/0.3048)
            else
                alt_av=mean([alt alt2]);
                fprintf('\taverage elevation is %.1f m',alt_av)
                alt = alt_av;
            end
        catch
        end
    catch
        try
            % requires Google API key
            load api_key.mat API_key
            alt = getElevations(lat,lon,'key',API_key);
            disp('Google Map API')
            fprintf('\tground elevation is %f m\n',alt)
        catch
            disp('failed')
            alt=0;
        end
    end
    fprintf('\taltitude is %.1f m\n',alt)
end

%% main computation
[omega,noon] = omeganoon(lat,lon,alt,tz,dte);
sset = noon + omega/360;
srise = noon - omega/360;
dayl = omega/180;

fprintf('\nsolar noon = %f\n',noon)
fprintf('solar noon = %s\n',datestr(noon))

middayhour=str2num(datestr(noon,'HH'));
fprintf('solar noon near %d o''clock. ',middayhour);
switch middayhour
    case 12
        fprintf('it''s probably Standard Time (ST)\n')
    case 13
        fprintf('it''s probably Daylight Saving Time (DST)\n')
    otherwise
        fprintf('huh?')
end
fprintf('omega = %f\n',omega)
fprintf('omega/360 = %f\n',omega/360)

% end of civil twilight (definition)
civil = noon + (omega+6)/360;

% time in hours offset from civil twilight
dt=-1;

% angle above horizon corresponding to specified time offset
deg_golden=((civil+dt/24)-noon)*360-omega;
fprintf('\n%.1f hours before civil twilight ends, the sun will be %.1f degrees above the horizon\n',-dt,-deg_golden)

golden = noon + (omega+deg_golden)/360;
d1=(sset-golden)*24*60;
d2=(civil-sset)*24*60;
d3=(civil-golden)*24*60;
fprintf(' golden hour starts %.1f minutes before sunset\n',d1)
fprintf('civil twilight ends %.1f minutes after sunset\n',d2)
fprintf('  golden hour lasts %.1f minutes\n',d3)
fprintf(' golden hour starts = %s\n',datestr(golden))
fprintf('civil twilight ends = %s\n',datestr(civil))

switch nargout
    case 0
        if autoloc
            fprintf('\nLocation: %g∞N, %g∞E, %gm\n',lat,lon,alt);
        end
        for n = 1:numel(dte)
            fprintf('Sunrise: %s %+03d\nSunset:  %s %+03d\nDay length: %ghr %gmin %gs\n\n', ...
                datestr(srise(n)),tz,datestr(sset(n)),tz, ...
                floor(24*dayl),floor(mod(24*dayl,1)*60),round(mod(1440*dayl,1)*60));

            % commute
            com_time=37;
            warn_time=5;
            dc=com_time+warn_time;

            fprintf('now = %s\n',datestr(now))
            
            % golden hour
            fprintf('golden hour\n');
            dt_golden=(golden-now)*24*60;
            dt_golden_min=mod(dt_golden,60);
            dt_golden_hr=(dt_golden-dt_golden_min)/60;
            fprintf('   %.1f hours or %d hours %.1f minutes until golden hour starts\n',dt_golden/60,dt_golden_hr,dt_golden_min)

            % commute
            dt_golden_comm=dt_golden-dc;
            dt_golden_comm_min=mod(dt_golden_comm,60);
            dt_golden_comm_hr=(dt_golden_comm-dt_golden_comm_min)/60;
            fprintf('   %.1f hours or %d hours %.1f minutes until you need to leave at %s\n',dt_golden_comm/60,dt_golden_comm_hr,dt_golden_comm_min,datestr(now+dt_golden_comm/60/24))         
            
            % sunset
            fprintf('sunset\n');
            ds=(sset-now)*24*60;
            dsm=mod(ds,60);
            dsh=(ds-dsm)/60;
            fprintf('   %.1f hours or %d hours %.1f minutes until sunset\n',ds/60,dsh,dsm)

            % commute
            dsc=ds-dc;
            dscm=mod(dsc,60);
            dsch=(dsc-dscm)/60;
            fprintf('   %.1f hours or %d hours %.1f minutes until you need to leave at %s\n',dsc/60,dsch,dscm,datestr(now+dsc/60/24))
            
            % daylight remaining
            fprintf('civil twilight\n');
            d4=(civil-now)*24*60;
            d4m=mod(d4,60);
            d4h=(d4-d4m)/60;
            fprintf('   %.1f hours or %d hours %.1f minutes until civil twilight ends\n',d4/60,d4h,d4m)

            % commute
            d5=d4-dc;
            d5m=mod(d5,60);
            d5h=(d5-d5m)/60;
            fprintf('   %.1f hours or %d hours %.1f minutes until you need to leave at %s\n',d5/60,d5h,d5m,datestr(now+d5/60/24))
        end
    case 1 % daylength
        varargout{1} = dayl;
    case 2 % sunrise, sunset
        varargout{1} = srise;
        varargout{2} = sset;
    case 3 % sunrise, sunset, noon
        varargout{1} = srise;
        varargout{2} = sset;
        varargout{3} = noon;
end

function [omega,noon] = omeganoon(lat,lon,alt,tz,dte)
% main function that computes daylength and noon time
% https://en.wikipedia.org/wiki/Sunrise_equation

% number of days since Jan 1st, 2000 12:00 UT
n2000 = dte - datenum(2000,1,1,12,0,0) + 68.184/86400;

% mean solar moon
Js = n2000 - lon/360;

% solar mean anomaly
M = mod(357.5291 + 0.98560028*Js,360);

% center
C = 1.9148*sind(M) + 0.0200*sind(2*M) + 0.0003*sind(3*M);

% ecliptic longitude
lambda = mod(M + C + 180 + 102.9372,360);

% solar transit
Jt = 2451545.5 + Js + 0.0053*sind(M) - 0.0069*sind(2*lambda);

% Sun declination
delta = asind(sind(lambda)*sind(23.44));

% hour angle (day expressed in geometric degrees)
h = (sind(-0.83 - 2.076*sqrt(alt)/60) - sind(lat).*sind(delta))./(cosd(lat).*cosd(delta));
omega = acosd(h);
% to avoid meaningless complex angles: forces omega to 0 or 12h
omega(h<-1) = 180;
omega(h>1) = 0;
omega = real(omega);

% noon
noon = Jt + datenum(2000,1,1,12,0,0) - 2451545 + tz/24;

function y=jsd(X,f)
% very simple interpretation of JSON string
k = find(~cellfun(@isempty,strfind(X,f)),1);
if ~isempty(k)
    y = str2double(regexprep(X{k},'.*:(.*)','$1'));
else
    y = NaN;
end
