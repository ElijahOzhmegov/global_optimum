function xend = penalty (f, g1, g2, g3, x0, r0, C, eps)
    r = r0;
  
    k = 0;

    alpha = 2;
    beta  = 0.5;
    gamma = 1;
    
    figure(1);
    plot ( [x0(1,:) x0(1,1)],[x0(2,:) x0(2,1)] ),grid on;
    hold on;
    
    R_eps = 0.2;
        
    function y = F(x)
        y = f(x) + (r/2) * ((( (g1(x)>0) * g1(x))^2) + ...
                            ( ((g2(x)>0) * g2(x))^2) + ...
                            ( ((g3(x)>0) * g3(x))^2));
    end

    while (1)
        xend = NELDER_MEAD (@F, x0, R_eps, alpha, beta, gamma);
        
        plot ( [xend(1,:) xend(1,1)],[xend(2,:) xend(2,1)] ),grid on;
        hold on;

        temp = (r/2) * ((( (g1(xend)>0) * g1(xend))^2) + ...
                        ( ((g2(xend)>0) * g2(xend))^2) + ...
                        ( ((g3(xend)>0) * g3(xend))^2));
        if (temp < eps)
            break; 
        else 
            r = r * C;
            k = k + 1;
            x0 = xend;
        end  
    end
    
end





