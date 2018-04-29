function [x,iter,conv] = gauss_seidel(A,b,x0,tol)
%% Gauss-Seidel method for solving sparse matrix
% A=L+U+D
D = diag(diag(A));  % Diagonoal matrix of A
L = tril(A,-1);     % Strictly lower triangle matrix of A
U = triu(A,1);      % Strictly upper triangle matrix of A
LD=L+D;
xi = x0;
ri = A*xi-b;
conv = norm(ri);
iter = 0;
while norm(ri) > tol  
%     x1=inv(L+D)*(b-U*x0);
    xi = (LD)\(b-U*xi);
    iter = iter+1;
    ri = A*xi-b;
    conv(iter,1) = norm(ri);
    if iter >= 1000
        warning('Terminate since iteration exceeded 1000');
        x = xi;
        break;
    end
end
x = xi;