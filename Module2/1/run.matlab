L = [0 10 1; 0.1 0 0; 0 0.9 0];

det(L)
inv(L)

syms a b c
L^5 * [a; b; c;]

results = zeros(3,51);
results(:,1) = [0; 100; 0];
for i=2:51
  results(:,i) = L*results(:,i-1);
end

fig = figure;
plot( results' )
xlabel('t')
legend('n 1','n 2','n 3','Location','NorthWest')
saveas(fig, 'fig1','jpg');

N = sum(results)
c = diff(N)./N(:, 1:end-1)
diff(N)./N(:, 1:end-1)

fig = figure;
plot(c)
saveas(fig, 'fig2','jpg');


s = sum(results);
fig = figure;
plot( results(1,:)./s,'b')
hold on
plot( results(2,:)./s,'g')
plot( results(3,:)./s,'r')
xlabel('t')
legend('p 1','p 2','p 3','Location','East')
saveas(fig, 'fig3','jpg');

L = [0 10 1; 0.1 0 0; 0 0.9 0];
n = (L^100)*[0; 100; 0]
n/sum(n)


[V,D] = eig(L)


L*V(:,1)
V(:,1)*D(1,1)


L*V(:,2)
V(:,2)*D(2,2)

L*V(:,3)
V(:,3)*D(3,3)


V(:,1)/sum(V(:,1))



