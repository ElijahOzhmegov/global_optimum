clear; clc; 

disp ('The book.s answer:');
x_answer = [0.25, 0.75]';
disp (x_answer);
x0 = [8 10 8; 9 11 11];

alpha = 2;
beta  = 0.5;
gamma = 1;

eps = 0.2;

x_result = NELDER_MEAD (@f, x0, eps, alpha, beta, gamma);
fprintf ('Nelder-Mead: %1.4f\n', norm( x_result - x_answer ));
disp (x_result);

