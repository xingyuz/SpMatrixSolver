function [xi,iter,error] = pcg(A, b)
%% Precondtioned Conjugate Gradient method for solving sparse matrix
L=ichol(A); % Incomplete cholesky factorized preconditioner
M=L*L';
x0=b;
r0=b-A*x0;
z0=M\r0;
error=norm(r0);
iter=0;
ri=r0;
zi=z0;
pi=z0;
xi=x0;
tol=1e-3;
while (1)
    alpha = (zi'*ri)/(pi'*A*pi);
    x1=xi+alpha*pi;
    r1=ri-alpha*A*pi;
    z1=M\r1;
    if norm(r1) < tol
        break;
    end
    bi=(z1'*r1)/(zi'*ri);
    p1=z1+bi*pi;
    iter=iter+1;
    pi=p1;
    ri=r1;
    zi=z1;
    xi=x1;
    error(iter,1) = norm(A*xi-b);
    if iter>=1000;
        warning('Terminate since iteration exceeded 1000');
%         x=xi;
        break;
    end
end