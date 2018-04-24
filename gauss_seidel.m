function [x,iter,error] = gauss_seidel(A,b)
%% Gauss-Seidel method for solving sparse matrix
% A=L+U+D
D = diag(diag(A));  % Diagonoal matrix of A
L = tril(A,-1);     % Strictly lower triangle matrix of A
U = triu(A,1);      % Strictly upper triangle matrix of A
x0 = sparse(zeros(length(A),1)); % Initial guess
xi = x0;
error = norm(A*xi-b);
iter = 0;
tol = 1e-3; % 
while error > tol  
%     x1=inv(L+D)*(b-U*x0);
    xi = (L+D)\(b-U*xi);
    iter = iter+1;
    error(iter,1) = norm(A*xi-b);
    if iter >= 1000;
        warning('Terminate since iteration exceeded 1000');
        x = xi;
        break;
    end
end
x = xi;