clear variables
x = optimvar('x');
y = optimvar('y');
z = optimvar('z');
prob = optimproblem;
prob.Constraints.cons1 = 2*x + 2*x + 2*x == 30;
prob.Constraints.cons2 = y + y + 2*x == 20;
prob.Constraints.cons3 = 2*z + 2*z + y == 13;

sol = solve(prob)

shoe=sol.x;
boy=sol.y;
snowcone=sol.z;

%2*shoe + (boy +2*snowcone)*2*snowcone
shoe + (boy + 2*snowcone + 2*shoe)*snowcone