clear all; clc;
A=[5 2 1
   2 4 1
   1 1 3];
[V D]=eig(A);
K1=D(3,3)/D(1,1)
K2=norm(A)*norm(A^-1)