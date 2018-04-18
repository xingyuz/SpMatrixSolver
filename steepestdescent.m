function [x,itr] = steepestdescent(A,b)
%% Steepest Descent method for solving sparse matrix
xi=b;
ri=b-A*xi;
itr=0;
tol=1e-6;
while norm(ri)>tol
    alpha = ri'*ri/(ri'*A*ri);
    xi=xi+alpha*ri;
    ri = ri-alpha*(A*ri);
    itr=itr+1;
end
x=xi;