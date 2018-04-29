function [x] = LUsolver(A,b)
[L U]=lu(A);;
% y=inv(L)*b;
% x=inv(U)*y;
y=L\b;
x=U\y;
