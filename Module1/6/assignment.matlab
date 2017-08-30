%# Assignment 6

%### Exercise 1.2.7

%##### Question 1
syms S Vmax K n;
j = Vmax * ( S/(K + S) )^n; 
dj = diff(j,S);
mj = matlabFunction(j,'vars',[S,K,Vmax,n]);
mdj = matlabFunction(dj,'vars',[S,K,Vmax,n]);
f1 = @(S) mj(S,1,10,3.0);
f2 = @(S) mdj(S,1,10,3.0);
limits = [0 20];
fig = figure;
subplot(2,1,1)
fplot(f1,limits,'r')
axis([0 20 0 10])
ylabel('j')
xlabel('[S]')
subplot(2,1,2)
fplot(f2,limits,'r')
ylabel('dj/d[S]')
xlabel('[S]')
saveas(fig, 'plot1','jpg');


%### Exercise 1.2.8

% #### i)
syms S Vmax K n;
j = Vmax * ( S/(K + S) )^n; 
dj = simplify (diff(j,S))
d2j = simplify (diff(dj,S));
Sm = solve(d2j,S,'Real',true)
% (K*n)/2 - K/2


% ####ii)

jm = Vmax*(Sm/(K + Sm))^n;
jm = simplify(jm, 'IgnoreAnalyticConstraints', true)
% (Vmax*(n - 1)^n)/(n + 1)^n

% ##### iii)
subs (Sm, [K,n],[1.0 3.0]) 
%  1

subs (jm, [K,Vmax,n],[1 10 3])
% 5/4 = 1.25 


%### Exercise 1.3.4
% i)
syms r;
N = 2*pi*r*(0.1 + r/1000)
int (N,r) 
%gives 
% (pi*r^2*(r + 150))/1500
% (plus integration constant) 

% ii)
syms r;
N = 2*pi*r*(0.1 + r/1000)
int(N,r,0,1000)  
% (2300000*pi)/3



%### Exercise 1.3.6

%i)

dN = @(N,r0,K) r0*N*(1-(N/K)^2);
fun = @(N) dN(N,0.0347,1000);
limits = [0 1200];
fig = figure;
fplot(fun, limits)
line( [0,1200], [0,0], 'Color', 'k' )
ylabel('dN/dt')
xlabel('N')
saveas(fig, 'plot2','jpg');



% iv)
syms N r0 K
f = r0*N*(1-(N/K)^2);
df = diff(f,N)
solve(df==0, N)
 % -(3^(1/2)*K)/3
 %  (3^(1/2)*K)/3

%% v)

N = dsolve('DN=r0*N*(1-(N/K)^2)', 'N(0)=N0', 't')
N = simplify(N)
% ((K^2*N0^2*exp(2*r0*t))/(K^2 - N0^2 + N0^2*exp(2*r0*t)))^(1/2)



syms L M r0 K t N0
L=dsolve('DL=r0*L*(1-L/K)','L(0)=N0','t')
L=simplify(L)
mL = matlabFunction(L,'vars',[N0,K,r0,t])
funL100 = @(t) mL(100,1000,0.0347,t);
funL5000 = @(t) mL(5000,1000,0.0347,t);

%modified Growth
M=dsolve('DM=r0*M*(1-(M/K)^2)', 'M(0)=N0','t')
M=simplify(M)
mM = matlabFunction(M,'vars',[N0,K,r0,t])
funM100 = @(t) mM(100,1000,0.0347,t);
funM5000 = @(t) mM(5000,1000,0.0347,t);

fig = figure();
limits = [0 300];
fplot(funL100, limits, 'b')
hold on
fplot(funM100, limits, 'r')
ylabel('dN/dt')
xlabel('N')
legend('Logistic Growth', 'Modified', 'Location', 'NorthEast')
saveas(fig, 'plot3','jpg');

fig = figure();
limits = [0 300];
fplot(funL5000, limits, 'b')
hold on
fplot(funM5000, limits, 'r')
ylabel('dN/dt')
xlabel('N')
legend('Logistic Growth', 'Modified', 'Location', 'NorthEast')
axis([0,300,1000,5000])

saveas(fig, 'plot4','jpg');






