function [normalized_TL] = tls(TL_in_dB)
%TLS Scale TL from [50,120] dB to [0,1].
%   Scales un-normalized TL values. Input values in the range [50,120] dB
%   are scaled or normalized [0,1]. Input values outside the range [50,120]
%   are clipped to [50,120]
%   
%   SEE ALSO: TLS

% assign scaling parameters
TL_min=50;
TL_max=120;
TL_span=TL_max-TL_min;

normalized_TL=(TL_in_dB-TL_min)/TL_span;

% restrict weight to [0,1]
normalized_TL = min(normalized_TL,1);
normalized_TL = max(normalized_TL,0);

end