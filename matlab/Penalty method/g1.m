% ����� �������
% ������� �9 - ���.291
% ������ ������ f(x) = (x1+4)^2 + (x2-4)^2 => min
% ��� ������������
% 2x1 - x2 <= 2; x1 >= 0; x2 >= 0
% �����: � �. � = (0,4)T - �������� �������
% =============================================================%
% ������� ����������� ������������� �� �������
function y = g1(x)
    y = 2*x(1) - x(2) - 2;
end
