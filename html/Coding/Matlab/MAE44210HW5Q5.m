%% BRANDON BELL - MAE 4421 - HW5 - Q5
clf; clc; clear;
OL = tf(8, [50 12]);
step(OL)
hold on;

CL = tf(8, [50 20]);
step(CL)
grid on;
legend ('Open Loop' , 'Closed Loop')
