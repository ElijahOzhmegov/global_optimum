clear;
clc;

syms g(x1,x2)
% g(x1,x2) = (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2;
g(x1,x2) = 100*(x2 - x1.^2) + (1 - x1).^2 + 10.1*(x2 - 1).^2;

x0 = [0 0];

eps1 = 0.1;
eps2 = 0.1;

M = 12;

result = Newton_Raphson (g, x0, eps1, eps2, M);

disp('The book.s answer: incorrect');