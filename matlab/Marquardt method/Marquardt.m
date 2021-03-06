% ������ �.�
% ������ ������ f(x) = ((x1)^2 + x2 - 11)^2 + (x1 +(x2)^2 - 7)^2 => min
% ������� ���������� �� ����� x0 = (0,0) mu_0 = -120 e_1=0.1 e_2=0.1
%--------------------------------------------------------------------------
% x0 = [0;0];
% e_1 = 0.1;
% e_2 = 0.1;
% M = 10; % ���������� ����� ��������
% �������� �������
function xend = Marquardt (f, grad_f, H, x0, eps, M)

%     if rand > 0.5
%         mu_k = max ( max (abs(H(x0))))*10;
%     else
%         mu_k = 10^4;
%     end

    mu_k = 120;
    
    k = 0;
    x_k = x0;
    
    while ( (norm (grad_f(x_k)) > eps) && (k < M) )
        d_k = H (x_k);
        d_k = d_k + mu_k * eye (size (H ([0, 0])));
        d_k = d_k\eye (size (H ([0, 0])));
        d_k = d_k*grad_f(x_k);

        if ( f(x_k - d_k.') < f (x_k))
            x_k = x_k - d_k.';
            k = k + 1;
            mu_k = mu_k/2;
            
            fprintf ('Generation: %d the point: (%1.3f; %1.3f)\n', ...
                                                k, x_k(1), x_k(2));
            % next is step 3
        else
            mu_k = mu_k*2;
            % next is step 7
        end
    end
    
    xend = x_k;
               
end
