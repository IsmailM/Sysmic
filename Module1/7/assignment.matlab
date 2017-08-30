% Exercise 1.4.1

%1

v = @(Y,K,k,n) k*Y^n/(K^n + Y^n);
ns = [1 3 5 10 100]; 
cols = ['r' 'b' 'g' 'k' 'c'];
limits = [0 5];
fig = figure;
hold on
for i=1:5,
    vt = @(Y) v(Y,1,10,ns(i));
    fplot(vt,limits,cols(i));
end
axis([0 5 0 10]);
ylabel('dX/dt');
xlabel('Y');
legend('n=1','n=2','n=5','n=10','n=100','Location','SouthEast');
saveas(fig, 'plot1','jpg');


% ii

v = @(Y,K,k,n) k*Y^n/(K^n + Y^n);
v1 = @(Y,K,k,n) k*K^n/(K^n + Y^n);
% n = 2; K = 1; k = 10; 
vt = @(Y) v(Y,1,10,2);
v1t = @(Y) v1(Y,1,10,2);

fig= figure;
fplot(vt,limits, 'r');
hold on 
fplot(v1t,limits, 'g');
legend('activator','deactivator')
saveas(fig, 'plot2','jpg');


% Exercise 1.4.4
% i)  
r=dsolve('DX=g*Y - b*X','DY=-c*Y','X(0)=X0','Y(0)=Y0','t');
X=simplify(r.X)
% (Y0*g*exp(-c*t))/(b - c) - (exp(-b*t)*(X0*c - X0*b + Y0*g))/(b - c)
Y=simplify(r.Y)
% Y0*exp(-c*t)

% ii) 
syms t Y0 c
mY = matlabFunction (Y, 'vars', [t Y0 c]);
fY_1 = @ (t) mY (t,10,0.1);
fig = figure;
fplot (fY_1, [0 50]) 
saveas(fig, 'plot3','jpg');


% v)
syms t b X0 c g Y0 
mX = matlabFunction (X, 'vars', [t b X0 c g Y0]);
fX_1 = @ (t) mX (t,1,0.1,0.1,1,10);
fig = figure;
fplot (fX_1, [0 50], 'b') 
saveas(fig, 'plot4','jpg');



%%% Exercise 1.5.1
addpath('./functions')

timespan = [0 15];
fig = figure
subplot (2,1,1);
y0 = [0.1 1.0];
[t,y] = ode45 (@ toggle,timespan,y0); 
plot (t,y)
ylabel ('u,v')
xlabel('time') 
legend ('u','v', 'Location','SouthEast')
subplot (2,1,2);
y0 = [5.0 4.0];
[t,y] = ode45 (@toggle,timespan,y0);
plot (t,y) 
ylabel ('u,v')
xlabel ('time')
legend ('u','v','Location','SouthEast')
saveas(fig, 'plot5','jpg');











