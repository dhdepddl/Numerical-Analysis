function [ sum ] = diagsum( A )
%UNTITLED4 �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
n = length(A);
sum = 0;
for i = 1:n
    sum = sum+abs(A(i, i));
end
end

