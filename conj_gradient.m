function [x,iter,conv] = conj_gradient(A,b,x0,tol)
%% Conjugate Gradient method for solving sparse matrix
r0=b-A*x0;
conv=norm(r0);
iter=0;
ri=r0;
pi=r0;
xi=x0;
while norm(ri) > tol
    rhoi = ri'*ri;
    Api = A*pi;
%     alpha = rhoi/(pi'*A*pi);
    alpha = rhoi/(pi'*Api);
    xi=xi+alpha*pi;
%     r1=ri-alpha*A*pi;
    r1=ri-alpha*Api;
    bi=r1'*r1/rhoi;
    pi=r1+bi*pi;
    iter=iter+1;
    ri=r1;
    conv(iter,1) = norm(ri);
    if iter>=1000
        warning('Terminate since iteration exceeded 1000');
        x=xi;
        break;
    end
end
x=xi;