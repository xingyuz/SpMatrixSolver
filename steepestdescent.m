function [x,iter, error] = steepestdescent(A,b)
%% Steepest Descent method for solving sparse matrix
xi=b;
ri=b-A*xi;
iter=0;
error=norm(ri);
tol=1e-3;
while norm(ri)>tol
    alpha = ri'*ri/(ri'*A*ri);
    xi=xi+alpha*ri;
    ri = ri-alpha*(A*ri);
    iter=iter+1;
    error(iter,1) = norm(A*xi-b);
    if iter>=1000;
        warning('Terminate since iteration exceeded 1000');
        x=xi;
        break;
    end
end
x=xi;