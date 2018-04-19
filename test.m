clear all;
rng default;
G = mmread('fe_4elt2.mtx');  % read adjacency matrix of graph
% G = mmread('fe_ocean.mtx');
% G = mmread('fe_rotor.mtx');
% G = mmread('fe_sphere.mtx');
% G = mmread('fe_tooth.mtx');
A=diag(sum(G))-G;
I=speye(length(A));
A=A+1e-1*I;
x=sparse(rand(length(A),1)*1);
b=A*x;
% tic;[x1,itr1] = jacobi(A,b);toc;
% tic;[x2,itr2] = gauss_seidel(A,b);toc;
% tic;[x3,itr3] = steepestdescent(A,b);toc;
% tic;[x4,itr4] = conj_gradient(A, b);toc;
% tic;[x5] = LUsolver(A,b);toc
x6 = cholsolver(A,b);
