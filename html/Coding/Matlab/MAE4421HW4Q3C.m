%% BRANDON BELL - MAE4421HW4Q3E

%%% Plotting the step response.
figure(1)
s = tf('s');
TF = tf( [199.9 1000] , [10 2000 1000] );
step(TF)
