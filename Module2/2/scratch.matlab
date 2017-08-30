load ovariancancer

grp
obs

fig = figure
bar( obs(:,1) )
saveas(fig, 'fig','jpg');

M = mvnrnd( 0, 1, 216 )
M = mvnrnd( [0 0], [ 1 0; 0 1], 216 )

cov(obs(:,1:2))

fig = figure
scatter(obs(:,179),obs(:,180))
saveas(fig, 'fig','jpg');

sample = mvnrnd([0,0,0],[1,0.9,0.1; 0.9,1,-0.1; 0.1,-.1,1],1000);



numSamples = 300;
my_cov_matrix = [1 -0.8 0.8; -0.8 1 -0.8; 0.8 -0.8 1];
samples = mvnrnd( [0 0 0], my_cov_matrix, numSamples );
fig = figure
scatter(samples(:,1),samples(:,2));
saveas(fig, 'fig','jpg');
fig = figure
scatter(samples(:,1),samples(:,3));
saveas(fig, 'fig','jpg');
fig = figure
scatter(samples(:,2),samples(:,3));
saveas(fig, 'fig','jpg');

mean1 = 0;
mean2 = 0;
var11 = 1;
var22 = 1;
var12 = 0;
sample = mvnrnd( [mean1 mean2], [ 0 1; 0 1], 100 );

[ 0 1;
  0 1 ],
fig = figure;
scatter(sample(:,1),sample(:,2))
saveas(fig, 'fig1','jpg');

numSamples = 100;
cov1 = [ 1 0.8; 0.8 1];
cov2 = [ 1 -0.8; -0.8 1];
samples1 = mvnrnd( [0 0], cov1, numSamples );
samples2 = mvnrnd( [0 0], cov2, numSamples );
est1 = cov(samples1)
est2 = cov(samples2)






%%%%%%%%%%%%%%%%%%%%%%%%
% Get data
load HudsonBayData.txt

% Plot
fig = figure;
plot(HudsonBayData(:,1),[HudsonBayData(:,2:3)])
saveas(fig, 'fig2','jpg')
%%%%%%%%%%%%%%%%%%%%%%%%





mat = [0.9 0.2; 0.1 0.8]
[V,D] = eig(mat)
V*D*inv(V)

M = mvnrnd( [0 0], [ 1 -0.9; -0.9 1], 100 )
Sigma = cov(M)
[V,D] = eig(Sigma)
V*D*inv(V) % Same as Sigma 



fig = figure
scatter(M(:,1),M(:,2))
axis([-4 4 -4 4]);
axis square
hold on
ev1 = V(:,1);
ev2 = V(:,2);
plot( [0 ev1(1)], [0 ev1(2)], 'r', 'LineWidth', 2 )
plot( [0 ev2(1)], [0 ev2(2)], 'r', 'LineWidth', 2 )
saveas(fig, 'fig3','jpg')


R = horzcat( V(:,2), V(:,1) )
Mp = ( M * R )
fig = figure()
scatter( Mp(:,1), Mp(:,2) )
axis([-5 5 -5 5]);
axis square
xlabel('First principal component')
ylabel('Second principal component')
saveas(fig, 'fig4', 'jpg')




M=mvnrnd([0 0],[ 1 -0.9; -0.9 1], 200 );
% Principle components
[pc,scores,ev] = pca(M);
% Plots
fig = figure();
subplot(2,1,2);
scatter( scores(:,1), scores(:,2) )
axis([-5 5 -5 5]);
axis square
xlabel('First principal component')
ylabel('Second principal component')

subplot(2,1,1);
scatter(M(:,1),M(:,2))
axis([-4 4 -4 4]);
axis square

hold on

ev1 = pc(1,:);
ev2 = pc(2,:);
plot( [0 ev1(1)], [0 ev1(2)], 'r', 'LineWidth', 2 )
plot( [0 ev2(1)], [0 ev2(2)], 'r', 'LineWidth', 2 )
xlabel('First data set')
ylabel('Second data set')
saveas(fig, 'fig5', 'jpg')



