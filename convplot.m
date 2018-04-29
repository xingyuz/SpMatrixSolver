close    
figure ( 1 )
set(gca,'FontSize', 18);
set(gca, 'YScale', 'log')
hold
plot(1:iter3, (conv3));
plot(1:iter4, (conv4));
plot(1:iter5, (conv5));
plot(1:iter6, (conv6));
plot(1:iter7, (conv7));
plot(1:iter8, (conv8));
legend('Jacobi','Gauss-seidel','SD','CG','PCG-ichol','PCG-SS');
title ( [filename, ' Iterative Methods Convergence Bahavior'])
xlabel ( 'Iterations' )
ylabel ( 'Norms of Residual' )
grid