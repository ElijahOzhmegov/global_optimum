clc; close all; clear all;
x0 = [0;0];
e_1 = 0.1;
e_2 = 0.1;
M = 10; % ���������� ����� ��������
% ����� �������-������ ������������ ������
xend = markvardt (@f, @grad_f, x0, e_1, e_2, M)
% ������ ������� �� �������� 
% xreal =[1/2; -5/4];
% % ������ ������� 
% err = norm(xend-xreal)