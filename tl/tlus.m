function [TL_dB] = tlus(normalized_TL)
%TLUS Un-scale TL from [0,1] to [50,120]
%   Un-scales normalized TL. Input values are normalized [0,1]. Output
%   values are converted to dB in the range [50,120].
%   
%   SEE ALSO: TLS

% assign scaling parameters
TL_min=50;
TL_max=120;
TL_span=TL_max-TL_min;

TL_dB=(normalized_TL*TL_span)+TL_min;

% restrict weight to [50,120]
TL_dB = min(TL_dB,120);
TL_dB = max(TL_dB,50);

end