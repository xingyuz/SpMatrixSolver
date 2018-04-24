function [x] = LUsolver(A,b)
[L U P]=lu(A);t1=toc;
% y=inv(L)*b;
% z=inv(P)*y;
% x=inv(U)*z;
y=L\b;
z=P\y;
x=U\z;
