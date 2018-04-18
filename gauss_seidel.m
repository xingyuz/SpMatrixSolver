function [x itr] = gauss_seidel(A,b)
%% Gauss-Seidel method for solving sparse matrix
D=diag(diag(A));  % Diagonoal matrix of A
% A=L+U
L=tril(A,-1)+D;   % Lower triangle matrix of A
U=triu(A,1);      % Strictly upper triangle matrix of A
x0=sparse(zeros(length(A),1)); % Initial guess
xi=x0;
x1=1;
itr=0;
tol=1e-2; % 
while norm(x1-xi)>tol
%     x1=inv(L)*(b-U*x0);
    x1=L\(b-U*x0);
    xi=x0;
    x0=x1;
    itr=itr+1;
end
x=x1;