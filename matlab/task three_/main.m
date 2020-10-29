clear;
clc; 

x0 = [-1 11 -1;
      -1 5  14];
  
r0 =  0.5;
C  = 2;
eps = 0.01;

x_result = penalty (@f, @g1, @g2, @g3, x0, r0, C, eps);

x_answer = [0, 4]';
error = norm (x_result(:,1) - x_answer);

disp ('Found approximate solution:')
disp (x_result(:,1));

disp ('The exact solution:')
disp (x_answer);

disp ('The error:')
disp (error);


