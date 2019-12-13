function hello(loops)
%HELLO Hello world program.
disp('hello world');
disp('MATLAB');

if nargin==0
    loops=3;
end
 for i=1:loops
     beep     
     if i==1
        fprintf(' %d beep\n',i);
    else
        fprintf(' %d beeps\n',i);
    end
     pause(1)
 end
end