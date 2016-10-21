addpath('./functions')

a = 0:25;
f = fibonacci(a);

fig = figure;
plot(a,f, '-bs', 'Linewidth',1,'Markersize',5)
title('Fibonacci Graph')
saveas(fig,'fig1','jpg')

fig = figure;
plot(a,log(f), '-bs', 'Linewidth',1,'Markersize',5)
title('Logarithmic Fibonacci Graph')
saveas(fig,'logfig1','jpg')

% ### Exercise 1.5.3
f_20 = [fibonacci(0:18); fibonacci(1:19)]; % Create a matrix (2 by 20) with the first 20 fibonacci no.
C = num2cell(f_20, 1); %  Convert each column into a Cell 
ratio = cellfun(@(c) c(2)/c(1), C); % apply a function on each cell (i.e. column)...

fig = figure;
plot(1:19, ratio, '-bs', 'Linewidth',1,'Markersize',5);
hold on;
plot([0,20], [1.6180,1.6180],'r');
title('Fibonacci Ratio Graph');
saveas(fig, 'ratio','jpg');
