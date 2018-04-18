clear all;
G = mmread('fe_4elt2.mtx');  % read adjacency matrix of graph
% A = mmread('fe_ocean.mtx');
% A = mmread('fe_rotor.mtx');
% A = mmread('fe_sphere.mtx');
% A = mmread('fe_tooth.mtx');
A=diag(sum(G))-G;
I=speye(length(A));
A=A+1e-1*I;
x=sparse(rand(length(A),1)*1);
b=A*x;
[x itr] = jacobi(A,b);