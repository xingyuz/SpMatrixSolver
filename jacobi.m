function [x,itr] = jacobi(A,b);
%% Jacobi method for solving sparse matrix
% A=D+L+U
D=diag(diag(A));  % Diagonoal matrix of A
L=tril(A,-1);     % Strictly lower triangle matrix of A
U=triu(A,1);      % Strictly upper triangle matrix of A
x0=sparse(zeros(length(A),1)); % Initial guess
xi=x0;
x1=Inf;
itr=0;
tol=1e-6; % 
while norm(x1-xi)>tol
    x1=inv(D)*(b-(L+U)*x0);
%     x1=D\(b-(L+U)*x0);
    xi=x0;
    x0=x1;
    itr=itr+1;
end
x=x1;
