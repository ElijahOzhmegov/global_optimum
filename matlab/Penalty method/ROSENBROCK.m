function result = ROSENBROCK (f, x0, eps, alpha, beta, N)

%% step one
n = length (x0);
d = eye (n);
delta = 0.05*ones(1,n);

y = zeros (n, n+1);
y(:,1) = x0';

l = 0;
k = [];
%% steps 2-5

step = 2;

while step < 5
    switch step
        case 2
            for i = 1:n
                if f(y(:,i) + delta(i)*d(:,i)) < f(y(:,i))
                    y(:,i+1) = y(:,i) + delta(i)*d(:,i);
                    d(:,i)   = alpha*d(:,i);
                else
                    y(:,i+1) = y(:,i);
                    d(:,i)   = beta*d(:,i);
                end
            end
            
            step = 3;
        case 3
            if y(:,end) < y(:,1)
                y(:,1) = y(:,end);
                l = 0;
                step = 2;
            else
                for k = 2:n
                    if y(:,end) < y(:,k)
                        l = 0;

                        step = 4;
                        break;
                    else
                        if l < N
                            l = l + 1;
                            temp = 0;
                            
                            for ii = 1:n
                                if abs (delta (ii)) < eps
                                    temp = temp + 1;
                                end
                            end

                            if temp == n
                                result = y(:,k);
                                break;
                            else
                                y(:,1) = y (:, end);
                                
                                step = 2;
                                break;
                            end
                        else 
                            
                            step = 4;
                            break;
                        end
                    end
                end
            end
            
        case 4
            x_k  = y(:,k);
            x_k1 = y(:, n+1);
            
            if (norm (x_k1 - x_k) <= eps)
                result = x_k1;
                
                step = 5;
            else
                lambda = zeros (1, n);
                
                a = zeros(1,n);
                b = zeros(1,n);
                new_d = zeros(1,n);
                
                for j = 1:n
                    lambda(j) = (x_k1(j) - x_k(j))./d(j);
                end
                
                for i = 1:n
                    if lambda(i) == 0
                        a(i) = d(i);
                    else
                        for jj=i:n
                            a(i) = a(i) + lambda(jj)*d(jj);
                        end
                    end
                    
                    if i == 1
                        b(1) = a(1);
                    else
                        new_d(i) = b(i)/ norm(b(i));
                        
                        for jj=i:i-1
                            b(i) = a(i) - a(i).' *(new_d(jj-1)).^2;
                        end
                    end
                    
                end
                
                d = new_d;
                delta = 0.05*ones(1,n);
                y(:,1) = x_k1;
                
                step = 2;
            end
    end
end
        







