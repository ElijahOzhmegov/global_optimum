function result = NELDER_MEAD (f, x0, eps, alpha, beta, gamma)

% step 1
k = 0;
n = size(x0,1);



x = [x0 zeros(n,4)];

while (1)
    % step 2
    x_l = x(:,1); % it will be the best point
    x_h = x(:,1); % it will be the worst point
    x_s = x(:,1); % it will be the 2nd worst point

    k_l = 1;
    k_h = 1;
    k_s = 1;

    for i=1:n+1
        if f(x(:,i)) < f(x_l)
            k_l = i;
            x_l = x(:,k_l);
        else
            if f(x(:,i)) > f(x_h)
                k_h = i;
                x_h = x(:,k_h);
            end
        end
    end
    
    for i=1:n+1
        if (f(x(:,i)) > f(x_l)) && (i ~= k_h)
                    k_s = i;
                    x_s = x(:,k_s);
        end
    end
    
    % step 3
    x(:,n+2) = (sum(x(:,1:n+1),2) - x_h) / n;
    
    % step 4
    sigma = 0;
    
    for i=1:n+1
        sigma = sigma + (f(x(:,i)) - f(x(:,n+2)))^2;
    end
    
    sigma = sqrt( sigma / (n + 1) );
    
    if sigma <= eps
        break;
    end
    
    % step 5
    x(:,n+3) = x(:,n+2) + gamma*(x(:,n+2) - x_h);
    
    % step 6 (1)
    if f(x(:,n+3)) <= f(x_l)
        x(:,n+4) = x(:,n+2) + alpha*(x(:,n+3) - x(:,n+2));
        
        if f(x(:,n+4)) < f(x_l)
            x(:,k_h) = x(:,n+4);
            x_h = x(:,n+4);
        else
            x(:,k_h) = x(:,n+3);
            x_h = x(:,n+3);
        end
    else
        % step 6 (3)
        if ( f(x(:,n+3)) > f(x_l) ) && ( f(x(:,n+3)) <= f(x_s) )
            x(:,k_h) = x(:,n+3);
            x_h = x(:,n+3);
        else
            % step 6 (2)
            if ( f(x(:,n+3)) > f(x_s) ) && ( f(x(:,n+3)) <= f(x_h) )
                x(:,n+5) = x(:,n+2) + beta*(x_h - x(:,n+2));
                x(:,k_h) = x(:,n+5);
                x_h = x(:,n+5);
            else
                % step 6 (4)
                for j=1:n+1
                    x(:,j) = x_l + 0.5*(x(:,j) - x_l);
                end
            end
        end
    end
    
    k = k + 1;
    
end

result = [x_l x_h x_s];