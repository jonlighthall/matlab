function hello(loops)
%HELLO Hello world program.
disp('hello world');
disp('MATLAB');

if nargin==0
    loops=3;
end
 for i=1:loops
     beep     
     fprintf(' %d beeps\n',i);
     pause(1)
 end
end