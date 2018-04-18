function [x0 itr] = conj_gradient(A, b)
%% Conjugate Gradient method for solving sparse matrix
x0=b;
r0=b-A*x0;
p0=r0;
itr=0;
ri=r0;
pi=r0;
xi=x0;
tol=1e-10;
while (1)
    alpha = ri'*ri/(pi'*A*pi);
    x1=xi+alpha*pi;
    r1=ri-alpha*A*pi;
    if norm(r1) < tol
        break;
    end
    bi=r1'*r1/(ri'*ri);
    p1=r1+bi*pi;
    itr=itr+1;
    pi=p1;
    ri=r1;
    xi=x1;
end