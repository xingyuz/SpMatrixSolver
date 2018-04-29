function [x,iter,conv] = jacobi(A,b,x0,tol)
%% Jacobi method for solving sparse matrix
% A=D+L+U
D = diag(diag(A));  % Diagonoal matrix of A
L = tril(A,-1);     % Strictly lower triangle matrix of A
U = triu(A,1);      % Strictly upper triangle matrix of A
R = L+U;
xi = x0;
ri = A*xi-b;
conv= norm(ri);
iter = 0;
while norm(ri) > tol
%     xi = inv(D)*(b-(L+U)*x0);
    xi = D\(b-(R)*xi);
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
