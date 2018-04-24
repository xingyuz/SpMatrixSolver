function [xi,iter,error] = conj_gradient(A,b,x0,tol)
%% Conjugate Gradient method for solving sparse matrix
r0=b-A*x0;
error=norm(r0)/norm(b);
iter=0;
ri=r0;
pi=r0;
xi=x0;
while (norm(ri)/norm(b) > tol)
    alpha = ri'*ri/(pi'*A*pi);
    x1=xi+alpha*pi;
    r1=ri-alpha*A*pi;
%     if norm(r1) < tol
%         break;
%     end
    bi=r1'*r1/(ri'*ri);
    p1=r1+bi*pi;
    iter=iter+1;
    pi=p1;
    ri=r1;
    xi=x1;
    error(iter,1) = norm(A*xi-b)/norm(b);
    if iter>=1000;
        warning('Terminate since iteration exceeded 1000');
 %         x=xi;
        break;
    end
end