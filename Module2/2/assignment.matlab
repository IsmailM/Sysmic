

load ovariancancer

number_of_cancer = sum(strcmp(grp,'Cancer') )

load ovariancancer;
fig = figure
imagesc(cov(obs'));
title('Ovarian Cancer ')
set(gca,'YDir','normal') % to flip the axis so that it reads bottom-to top, use 
hold on
x=[number_of_cancer number_of_cancer];
y=[0 216];
line(x,y, 'LineWidth', 3, 'Color', [0 0 0])
x2=[0 216];
y2=[number_of_cancer number_of_cancer];
line(x2,y2, 'LineWidth', 3, 'Color', [0 0 0])
hold off

xlabel('Cancer                           Control')
ylabel('Cancer                            Control')
colorbar
saveas(fig, 'figure1','jpg');




[pc,scores,ev] = pca(obs);

fig = figure();
bar(ev(1:10)./sum(ev))
xlabel('Principal Components')
saveas(fig, 'figure2','jpg');


[pc,scores,ev] = pca(obs);
pc1 = scores(:,1);
pc2 = scores(:,2);
pc1_normal = pc1(strcmp(grp, 'Normal'));
pc2_normal = pc2(strcmp(grp, 'Normal'));

pc1_cancer = pc1(strcmp(grp, 'Cancer'));
pc2_cancer = pc2(strcmp(grp, 'Cancer'));

fig = figure();
scatter(pc1_cancer, pc2_cancer, 'r');
axis square;
xlabel('PC1')
ylabel('PC2')
hold on;
scatter(pc1_normal, pc2_normal, 'b');
saveas(fig, 'figure3','jpg');


