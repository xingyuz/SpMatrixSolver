close    
figure ( 1 )
set(gca,'FontSize', 24);
set(gca, 'YScale', 'log')
hold
plot(1:iter3, (conv3),'LineWidth',1.5);
plot(1:iter4, (conv4),'LineWidth',1.5);
plot(1:iter5, (conv5),'LineWidth',1.5);
plot(1:iter6, (conv6),'LineWidth',1.5);
plot(1:iter7, (conv7),'LineWidth',1.5);
plot(1:iter8, (conv8),'LineWidth',1.5);
legend('Jacobi','Gauss-seidel','SD','CG','PCG-ichol','PCG-SS');
title ( [filename, ' Iterative Methods Convergence Bahavior'])
xlabel ( 'Iterations' )
ylabel ( 'Norms of Residual' )
grid