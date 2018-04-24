function [x,iter, error] = steepestdescent(A,b,x0,tol)
%% Steepest Descent method for solving sparse matrix
xi=x0;
ri=b-A*xi;
iter=0;
error=norm(ri)/norm(b);
while norm(ri)/norm(b)>tol
    alpha = ri'*ri/(ri'*A*ri);
    xi=xi+alpha*ri;
    ri = ri-alpha*(A*ri);
    iter=iter+1;
    error(iter,1) = norm(A*xi-b)/norm(b);
    if iter>=1000;
        warning('Terminate since iteration exceeded 1000');
        x=xi;
        break;
    end
end
x=xi;