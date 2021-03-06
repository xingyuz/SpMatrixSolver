clear all;
rng default;
filename = 'fe_4elt2.mtx'; 
% filename = 'fe_ocean.mtx'; 
% filename = 'fe_rotor.mtx'; 
% filename = 'fe_sphere.mtx'; 
% filename = 'fe_tooth.mtx'; 
G = mmread(filename);  % read adjacency matrix of graph
A=diag(sum(G))-G;
I=speye(length(A));
A=A+1e-6*I;
x=sparse(rand(length(A),1)*1);
b=A*x;
x0=b;
tol=1e-3;
tic;xx=A\b;toc
tic;[x1] = LUsolver(A,b);t1=toc;
tic;[x2] = cholsolver(A,b);t2=toc;
tic;[x3,iter3,conv3] = jacobi(A,b,x0,tol);t3=toc;
tic;[x4,iter4,conv4] = gauss_seidel(A,b,x0,tol);t4=toc;
tic;[x5,iter5,conv5] = steepestdescent(A,b,x0,tol);t5=toc;
tic;[x6,iter6,conv6] = conj_gradient(A,b,x0,tol);t6=toc;
% Incomplete cholesky factorized preconditioner
L1=ichol(A); 
M1=L1*L1';
tic;[x7,iter7,conv7] = mypcg2(A,b,x0,L1,tol);t7=toc;
% Spectral sparsification preconditioner
L2 = ssmatrix(filename);  
M2 = L2*L2';
tic;[x8,iter8,conv8] = mypcg2(A,b,x0,L2,tol);t8=toc;

%plot convergence behavior
convplot;

% tic;[x1,fl1,rr1,it1,rv1] = pcg(A,b,1e-5,1000,M);t10=toc;
% tic;[x2,f22,rr2,it2,rv2] = pcg(A,b,1e-5,1000,L,L');t11=toc;
% tic;[x9,iter9,conv9] = mypcg(A,b,x0,M1,tol);t9=toc;

% test7

