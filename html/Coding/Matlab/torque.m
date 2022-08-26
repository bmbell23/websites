
clc; clear; clf;

run = true;

while run == true

k=input('k? ');

t = linspace(0,360,361);

deg = [sind(t); (1+k*cosd(t))];

plot(t,sum(deg))

clc;

end