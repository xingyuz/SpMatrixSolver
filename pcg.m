function [x,iter,error] = pcg(A,b,x0,tol)
%% Precondtioned Conjugate Gradient method for solving sparse matrix
L=ichol(A); % Incomplete cholesky factorized preconditioner
M=L*L';
r0=b-A*x0;
z0=M\r0;
error=norm(r0)/norm(b);
iter=0;
ri=r0;
zi=z0;
pi=z0;
xi=x0;
while (norm(ri)/norm(b) > tol)
    alpha = (zi'*ri)/(pi'*A*pi);
    x1=xi+alpha*pi;
    r1=ri-alpha*A*pi;
    z1=M\r1;
%     if norm(r1)/norm(b) < tol
%         break;
%     end
    bi=(z1'*r1)/(zi'*ri);
    p1=z1+bi*pi;
    iter=iter+1;
    pi=p1;
    ri=r1;
    zi=z1;
    xi=x1;
    error(iter,1) = norm(A*xi-b)/norm(b);
    if iter>=1000;
        warning('Terminate since iteration exceeded 1000');
        x=xi;
        break;
    end
end
x=xi;