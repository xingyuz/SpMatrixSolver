close    
figure ( 1 )
set(gca,'FontSize', 18);
set(gca, 'YScale', 'log')
hold
plot(1:iter1, (conv1));
plot(1:iter2, (conv2));
plot(1:iter3, (conv3));
plot(1:iter4, (conv4));
plot(1:iter5, (conv5));
legend('Jacobi','Gauss-seidel','SD','CG','PCG-ichol','PCG-SS');
title ( 'fe\_4elt2 Iterative Methods Convergence Bahavior' )
xlabel ( 'Iterations' )
ylabel ( 'Norms of Residual' )
grid