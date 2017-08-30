%# Assignment 5

%### Exercise 1.1.5

%##### Question 1

time = 0:15:180; 
N = zeros(1, length(time)); 
N(1) = 1;
for j = 2:length(time)
    N(j) = 2*N(j-1); 
end

fig = figure;
plot(time, N,'x')
plot(time, N) 
xlabel('time (minutes)','fontsize',12) 
ylabel('N_j','fontsize',12)
saveas(fig, 'plot1','jpg');

%### Exercise 1.1.7

%##### Question 1

syms N0 R
assume(R,'real')
assume(R>0)
R = solve( 2*N0 == N0*(1+R)^15, R)  
%   R = 2^(1/15) - 1
eval (R) 
%  0.0473

k = log(1+R) 
eval (k)
%  0.0462
N_o = 250 % given in question 


%##### Question 2

t2 = 0:1:120;
N2 = zeros(1, length(t2););
N2(1) = 250;
for j=2:length(t2);
     N2(j) = 1.0473*N2(j-1);
end

fig = figure;
plot(t2,N2,'o')
hold on 
fun2 = @(t) 250*exp(log(1.0473)*t); 
limits = [0 120];
fplot(fun2,limits,'r')
saveas(fig, 'plot2','jpg');
 

%### Exercise 1.1.9

%##### Question 1
fun = @(t) 10000*exp(-0.0116*t); 
t = 0:420; 
N = zeros (1,length(t));
N(1) = 10000; 
for j=2:length(t)
    N(j)=0.5*N(j-1); 
end
N

%##### Question 1
line ([10,100],[100,100]) 
values_above_100 = find (N>100);
t_100 = time(values_above_100(end)+1)
% 7 minutes 
 
fig = figure;
limits = [0 420];
fplot(fun,limits, 'ro')
xlabel('time (minutes)')
ylabel('N')
saveas(fig, 'plot3','jpg');


%### 1.1.11
%##### Question 1
fun = @(t, r0, N0, K) K*N0*exp(r0*t)/(K-N0+N0*exp(r0*t)); 
fun1 = @(t) fun(t, 0.02, 500, 20000);
fun2 = @(t) fun(t, 0.02, 10000, 20000); 
fun3 = @(t) fun(t, 0.02, 80000, 20000); 
limits = [0 600];
fig = figure;
fplot(fun1,limits,'b')
hold on
fplot(fun2,limits,'r')
hold on 
fplot (fun3,limits, 'g') 
xlabel('time','fontsize',12)
ylabel('N','fontsize',12)
legend('N_0=500','N_0=10000','N_0=80000')
axis([-inf,600,0,80000])
saveas(fig, 'plot4','jpg');
