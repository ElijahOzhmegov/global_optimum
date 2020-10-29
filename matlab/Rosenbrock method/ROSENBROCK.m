% ������ �.�.
%������ �5 - ���.175
% ������ ������: f(x)=1-2*x1-2*x2-4*x1*x2+10*(x1)^2+2*(x2)^2=>min
% �������� ������������, ���������������� �������������, �����������
% �����������, ����������.
%�����: ������ ������� (0,25;0,75)T
%=======================================================================%

% ������� ����������
function result = ROSENBROCK (f, x0, eps, alpha, beta, N)
% �������� ������� �� ������ ����������
%=====================================================================%
% ��� �1.
% ������ ��������� ����� x0, �� ������� ����� �������������� ������������
% ����� ����������� �������� ������� x0 = [ 0.1; 0.11];
% ������ ����� eps > 0 ��� ��������� ��������� eps = 0.0001;
% ������ ����������� ���������� alpha > 1 => alpha = 3;
% ������ ����������� ������ 0 < beta < 1 => beta = -0.5;

% ����� x0, �.�. ���������� ��������� (n = 2)
n = length (x0);
% ��������, � �������� �������� ����������� � ������������� �����������, 
% ������������ �����������:
d = eye (n);
% ������� ��������� ����� ���� ����� ������� �� ����������� ������ delta0 > 0
% delta0_1 = 0.05;
% delta0_2 = 0.05;
delta_0 = 0.05*ones(1,n);
% ������� ����������� ����� ��������� ����� ����� �� ���� ������������ �� ����� ��������  N = 10;
% ���������� ��������� ����� ����� �� ���� ������������ �� ����� ��������
l = 0;
% ���������� �������� y = x0
y = zeros (n, n+1);
y(:,1) = x0;
% ���������� �������� ���������� �������� k = 0
k = 0;
% ���������� �������� delta_i = delta_i_0 ��� ���� i
delta_i = delta_0;
r = 1; % �������
xk = x0; %xk_1 = x0;

% �������� ������� �� 4 �����, ������������� �������� �������� switch,
% ������� ����� ���������� � ���� 4 ����, ��� ����� ��� ������� �� ���������� �������
step = 2; % ����� ����� ���� ����������� ������ ��������� � ���� �2

% ========================================================================= 
% ��� �2. ������� ��� �� i -�� �����������
% ������� 5 �����, ��� 5 ��� ����� ���������� ��������� ������ �������
while step ~= 5
    switch step
        case 2 % ==========================================================
             for i = 1:n
                   if (f(y(:, i) + delta_i(i) * d(:, i)) < f(y(:, i))) 
                       y(:, i+1) = y(:, i) + delta_i(i) * d(:, i);
                       delta_i(i) = alpha*delta_i(i);    
                   else
                       y(:, i+1) = y(:, i);
                       delta_i(i) = beta*delta_i(i); 
                   end
                   
                   step = 3;
             end
             
        case 3 % ==========================================================
        % a) ���� ���� �� ���� ����� �� ����������� �� ���� �2 ��� ��������
            if (f(y(:, n+1)) < f (y(:, 1)))
                y (:, 1) = y (:, n+1);
                step = 2; % ������� � ����2
            end
            % �) ���� ������ �� n ��������� ����� ��� ���������, �� ������� ���������� ������ �� ������� ��������
            if  (f(y(:, n+1)) == f(y(:, 1)))
                xk =y(:, k+1);
                
                if (f(y(:, n+1)) < f(xk))
                    step = 4; % ������� � ����4
                end
                % ���� �� ���� �� ������ �������� ���� �� k-�� ��������, �� ������� �������������
                if (f(y(:, n+1)) == f(xk))
                    step = 5; % ���������� ������
                end
                
            end
            % ���� ����� ��������������� ��������� ����� ����� �� ����
            % ������������ �� ������� �������� �� ��������� N, ��������� ������� ���������
            if (l <= N)
                l = l + 1;
                % �������� ������� ���������
                while (r <= n) 
                    if (abs (delta_i (r)) <= eps)
                        r = r + 1;
                    else
                        r = n + 1;
                        y(:,1) = y(:, n+1);
                        step = 2; % ������� � ���� �2
                    end
                end
                
                r = 1;
                
                if step ~=2
                    result = xk;
                    disp ('Found approximate solution:')
                    disp (result);
                    % xk
                    step = 5; % ���������� 
                end
            else 
                step = 4; % ������� � ���� �4
            end
       % ��� �4. �������� ��������� �������
        case 4 % ==========================================================
            l = 0;
            xk_1 = y(:, n+1);
            
            if (norm (xk_1 - xk) <= eps)
                % ���� ����������� ��� �������, �� ����� ������� �����������
                step = 5;
                disp ('Found approximate solution:')
                result = xk_1;
                disp (result);
%                 xk_1
            else
                m = 1;
                lambda = zeros (1, n);
                
                for m = 1:n
                    lambda(m) = (xk_1(m) - xk(m))./d(m);
                end
                
                % ���������� ��������� ����� ����� ������� ����������� �
                % ������� ������������� ����������� ������, ���������
                % ��������� �����-������

                a = zeros(1,n);
                b = zeros(1,n);
                D = zeros(1,n);
                
                if (lambda(m) == 0)
                   a(m) = d(m);
                else
                   a(m) = a(m) + lambda(m)*d(m);
                end
                
                if (m == 1)
                   b (m) = a (m);
                else
                   b(m) = a(m) - a(m-1)*D(m-1)*D(m-1);
                   D(m) = b(m)/(norm(b(m)));
                end
                
                % ����� ���������� ����� �����������, ������� ��������, ���:
                d = D; 
                k = k + 1; 
                delta_i = delta_0;
                y(:,1) = xk_1;
                step = 2;                                                
            end          
    end
end