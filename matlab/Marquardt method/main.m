clc; 
clear;


x0 = [0 0];
e_1 = 0.1;
M = 10; % ïðåäåëüíîå ÷èñëî èòåðàöèé


syms g(x1,x2)
g(x1,x2) = (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2;

x =  sym('x', [1 length(argnames(g))]);

grad_g    = gradient(g);
hessian_g = hessian (g, x);

f         = matlabFunction ( g        (x1,x2), 'var', {x}); % At this moment don't know how to improve it
grad_f    = matlabFunction ( grad_g   (x1,x2), 'var', {x});
hessian_f = matlabFunction ( hessian_g(x1,x2), 'var', {x});


% Âûçîâ ôóíêöèè-ìåòîäà ãðàäèåíòíîãî ñïóñêà
xend = Marquardt (f, grad_f, hessian_f, x0, e_1, M);