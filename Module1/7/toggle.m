function ydot=toggle(t,y)
    alpha1 = 10.0;
    alpha2 = 10.0;
    beta = 3.0;
    gamma = 3.0;
    
    du = -y(1) + alpha1/(1+(y(2)^beta));
    dv = -y(2) + alpha2/(1+(y(1)^gamma));
    
    ydot = [du; dv]