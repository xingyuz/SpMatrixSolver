close    
figure ( 1 )
set(gca, 'YScale', 'log')
hold
plot(1:iter1, (error1));
plot(1:iter2, (error2));
plot(1:iter3, (error3));
plot(1:iter4, (error4));
plot(1:iter5, (error5));
% plot (1:iter1, log10(error1));
% plot (1:iter2, log10(error2));
legend('jacobi','gauss-seidel','SD','CG','PCG');
%     title ( 'Log (Error^2)' )
%     xlabel ( 'Step' )
%     ylabel ( 'Error' )
grid