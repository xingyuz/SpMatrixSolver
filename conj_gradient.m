function [xi,iter,error] = conj_gradient(A, b)
%% Conjugate Gradient method for solving sparse matrix
x0=b;
r0=b-A*x0;
error=norm(r0);
iter=0;
ri=r0;
pi=r0;
xi=x0;
tol=1e-3;
while (1)
    alpha = ri'*ri/(pi'*A*pi);
    x1=xi+alpha*pi;
    r1=ri-alpha*A*pi;
    if norm(r1) < tol
        break;
    end
    bi=r1'*r1/(ri'*ri);
    p1=r1+bi*pi;
    iter=iter+1;
    pi=p1;
    ri=r1;
    xi=x1;
    error(iter,1) = norm(A*xi-b);
    if iter>=1000;
        warning('Terminate since iteration exceeded 1000');
 %         x=xi;
        break;
    end
end