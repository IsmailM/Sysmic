addpath('./functions')

t.final = 5
initial_conc = [1 0 0 0 0]
[t, y] =ode45(@model_a_ode, [0 5], initial_conc )

