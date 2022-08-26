
clear; clc;

d = input('Link 1? '); a = input('Link 2? ');
b = input('Link 3? '); c = input('Link 4? ');
t2 = input('Angle 2? ');

k1 = d/a; k2 = d/c; k4 = d/b;
k3 = (a^2-b^2+c^2+d^2)/(2*a*c);
k5 = (c^2-d^2-a^2-b^2)/(2*a*b);

A = cosd(t2)-k1-k2*cosd(t2)+k3;
B = -2*sind(t2); E = -2*sind(t2);
C = k1-(k2+1)*cosd(t2)+k3;
D = cosd(t2)-k1+k4*cosd(t2)+k5;
F = k1+(k4-1)*cosd(t2)+k5;


t41 = 2*atand((-B+sqrt(B^2-4*A*C))/(2*A));
t42 = 2*atand((-B-sqrt(B^2-4*A*C))/(2*A));


t31 = 2*atand((-E+sqrt(E^2-4*D*F))/(2*D));
t32 = 2*atand((-E-sqrt(E^2-4*D*F))/(2*D));

t = [t41 t42 t31 t32];
for i=1:4
    if t(1,i) < 0
        t(1,i)= 360+t(1,i);
    end
end
clc; disp(t);