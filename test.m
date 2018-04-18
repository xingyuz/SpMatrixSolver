clear all;
A = mmread('fe_4elt2.mtx');  % read adjacency matrix of graph
% A = mmread('fe_ocean.mtx');
% A = mmread('fe_rotor.mtx');
% A = mmread('fe_sphere.mtx');
% A = mmread('fe_tooth.mtx');
G=diag(sum(A))-A;
tic
[L,U,P] = lu(G);
toc
tic
LL = chol(G,'lower');
toc
tic
RR = chol(G,'upper');
toc