function [ sum ] = nondiag( A )
%UNTITLED3 �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
n = length(A);
sum = 0;
for i = 1:n
    each = 0;
    for j = 1:n
        each = each + abs(A(i, j));
    end
    each = each - abs(A(i, i));
    sum = sum + each;
end
end

