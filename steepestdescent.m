function [x,iter, conv] = steepestdescent(A,b,x0,tol)
%% Steepest Descent method for solving sparse matrix
xi=x0;
ri=b-A*xi;
iter=0;
conv=norm(ri);
while norm(ri)>tol
    rhoi = A*ri;
    alpha = ri'*ri/(ri'*rhoi);
    xi=xi+alpha*ri;
    ri = ri-alpha*rhoi;
    iter=iter+1;
    conv(iter,1) = norm(ri);
    if iter>=1000
        warning('Terminate since iterations exceeded 1000');
        x=xi;
        break;
    end
end
x=xi;