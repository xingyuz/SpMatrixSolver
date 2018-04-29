function [x,iter,conv] = mypcg(A,b,x0,M,tol)
%% Precondtioned Conjugate Gradient method for solving sparse matrix

r0=b-A*x0;
z0=M\r0;
conv=norm(r0);
iter=0;
ri=r0;
zi=z0;
pi=z0;
xi=x0;
while norm(ri) > tol
    rhoi=A*pi;
%     alpha = (zi'*ri)/(pi'*A*pi);
    alpha = (zi'*ri)/(pi'*rhoi);
    x1=xi+alpha*pi;
    r1=ri-alpha*rhoi;
    z1=M\r1;
    bi=(z1'*r1)/(zi'*ri);
    p1=z1+bi*pi;
    iter=iter+1;
    pi=p1;
    ri=r1;
    zi=z1;
    xi=x1;
    conv(iter,1) = norm(ri);
    if iter>=1000
        warning('Terminate since iteration exceeded 1000');
        x=xi;
        break;
    end
end
x=xi;