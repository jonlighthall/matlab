function hello(loops,do_pause,do_beep)
%HELLO Hello world program.
%
%   For all arguments, fuction will print 'hello world' and 'MATLAB'
%
%   HELLO prints 3 'beeps' with a pause between each beep
%
%   HELLO(LOOPS) prints LOOPS number of 'beeps' with a pause between each
%   beep
%
%   HELLO(LOOPS,DO_PAUSE) prints LOOPS number of 'beeps' with an optional
%   pause between each beep
%
%   HELLO(LOOPS,DO_PAUSE,DO_BEEP) prints iteration number LOOPS number of
%   times with an optional 'beep' and an optional pause between each
%   iteration
disp('hello world');
disp('MATLAB');
%% set options based on input
switch nargin
    case 0
        loops=3;
        do_pause=true;
        do_beep=true;
    case 1
        do_pause=true;
        do_beep=true;
    case 2
        do_beep=true;
end
%% execute loop
for i=1:loops
    if do_beep
        beep
        if i==1
            fprintf(' %d beep\n',i);
        else
            fprintf(' %d beeps\n',i);
        end
    else
        fprintf(' %d\n',i);
    end
    if do_pause
        pause(1)
    end
end
end