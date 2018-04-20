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
tic;[x1,iter1] = jacobi(A,b);toc;
tic;[x2,iter2] = gauss_seidel(A,b);toc;
% tic;[x3,iter3] = steepestdescent(A,b);toc;
% tic;[x4,iter4] = conj_gradient(A, b);toc;

% e = cputime;[x3,iter3] = steepestdescent(A,b);t3=cputime-e;
% e = cputime;[x4,iter4] = conj_gradient(A, b);t4=cputime-e;

% tic;[x5] = LUsolver(A,b);toc;
% tic;x6 = cholsolver(A,b);toc;
% tic;xx=A\b;toc;