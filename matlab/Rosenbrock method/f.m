% ������ �.�.
% ������ �5 - ���.175
% ������ ������: f(x)=1-2*x1-2*x2-4*x1*x2+10*(x1)^2+2*(x2)^2=>min
% �������� ������������, ���������������� �������������, �����������
% �����������, ����������.
%�����: ������ ������� (0,25;0,75)T
%=======================================================================%

% �������� �������:
function y = f(x)
    y = 1 - 2*x(1) - 2*x(2) - 4*x(1)*x(2) + 10*(x(1))^2 + 2*(x(2))^2;
%     y = x(1)^3 + x(2)^2 - 3*x(1) - 2*x(2) + 2;
%     y = (x(1) - 2)^2 + (x(2) - 5)^2 + (x(3) + 2)^2;
end





