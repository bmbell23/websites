clc;
a = 1; c = 36; wn = sqrt(c);
b = [18 15 12 10 5 0];

x = zeros(6);

for j = 1:6
    
x(1,j) = (-b(j) + sqrt( b(j)^2 - 4*a*c)) / (2*a);

x(2,j) = (-b(j) - sqrt( b(j)^2 - 4*a*c)) / (2*a);

end

x = x(1:2,:);
disp(x)

z = b/12;
disp(z)

xmin = min(x);
Ts = (-4./real(xmin));
disp(Ts)

wd = abs(imag(x(1,:)))./(2*pi);
disp(wd)