function hello(loops,do_pause)
%HELLO Hello world program.
disp('hello world');
disp('MATLAB');

switch nargin
    case 0
        loops=3;
        do_pause=true;
    case 1
        do_pause=true;   
end
 for i=1:loops
     beep     
     if i==1
        fprintf(' %d beep\n',i);
    else
        fprintf(' %d beeps\n',i);
    end
    if do_pause
        pause(1)
    end
end
end