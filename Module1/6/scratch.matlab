v = @(S) 10*S/(1+S);
limits = [0 10];

fplot(v,limits)
axis([0 10 0 10])
ylabel('rate')
xlabel('[S]')


v = @(S,K,Vmax) Vmax*S/(K + S); 
v1 = @(S) v(S,0.1,10);
v2 = @(S) v(S,1,10);
v3 = @(S) v(S,10,10); 
limits = [0 10];
fplot(v1,limits,'r')
hold on
fplot(v2,limits,'b')
fplot(v3,limits,'g')
axis([0 10 0 10])
ylabel('rate')
xlabel('[S]')
legend('K=0.1','K=1','K=10','Location','SouthEast')



v = @(S,k1,k_1,k2,E_0) k2*E_0*S/( ((k_1 + k2)/k1 ) + S); 

fig = figure;
v1 = @(S) v(S,0.01, 0.003, 0.03, 4);
limits = [0 100]; 
fplot(v1,limits,'r')
saveas(fig, 'plot1','jpg');

%define Michaelis-Menten function
v = @(S,Km,Vmax) Vmax*S/(Km + S); 
% Calc value of Km
%Using Km = ( k-1 + k2 ) / k1 
Km = (0.003 +  0.030)/0.01
%produces Km = 3.3000

% Calc value of Vmax
% Using Vmax = k2 [E]0 
Vmax = 0.030*4.0
%produces Vmax= 0.12

v1 = @(S) v(S,3.3,0.12);
limits = [0 100]; 
fplot(v1,limits,'r')






% Section 1.3

funD = @(r) 0.1 + r/500;
limits = [0 500];

funD(0)
funD(500)

syms r;
dN=2*pi*r*(0.1 + 0.002*r);
int(dN,r) 

g=int(dN,r);
gg=matlabFunction(g);
n=gg(500)-gg(0);
n 



% Section 1.3.2


