function result = Newton_Raphson (g,x0, eps1, eps2, M)
% step 2
x =  sym('x', [1 length(argnames(g))]);

grad_g    = gradient(g);
hessian_g = hessian (g, x);

f      = matlabFunction ( g        , 'var', {x});
grad_f = matlabFunction ( grad_g   , 'var', {x});
H      = matlabFunction ( hessian_g, 'var', {x});

k = 0;

x_k  = x0;

syms t

indicator = 0;

% step 3, 4, 5
while (norm (grad_f(x_k)) > eps1) && (k < M)
    % step 6
    d_k = H(x_k);
    
    % step 7 
    d_k = d_k \ eye (size (H (x0)));
    
    % step 8
    if det(d_k) > 0
        d_k = - d_k*grad_f(x_k);
    else
        d_k = - grad_f(x_k);
    end
    
    d_k = d_k.';
    
    % step 9 is useless
    
    % step 10    
    phi = g;
    phi = diff( subs(phi, x, x_k + t*d_k), t);
    t_k = double( solve(phi, t) );
    
    t_k = t_k(end);
    
    % step 11
    x_k1 = x_k + t_k*d_k;
    
    fprintf ('%d | x = (%+1.3f; %+1.3f) | t = %+3.3f\n', ...
                               k , real(x_k1(1)), real(x_k1(2)), real(t_k));
    
    % step 12
    if (norm( x_k1 - x_k ) < eps2) && ( abs( f(x_k1) - f(x_k)) < eps2 )
        indicator = indicator + 1;
    else
        indicator = 0;
    end
    
    if indicator == 2
        break;
    end
    
    x_k = x_k1;
    k = k + 1;
    
end

result = real(x_k);