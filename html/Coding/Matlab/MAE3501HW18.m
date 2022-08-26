%% Brandon M Bell - MAE 3501 - Homework 18

N = linspace(0,10,1000);

bN=zeros(10,1);
for i = 1:10

bN(i) = (2/(pi*i))*(1-cos(i*pi));

end

xL = linspace(0,1,1000);

f1 = bN(1)*sin(1*pi*xL);
f3 = bN(3)*sin(3*pi*xL);
f5 = bN(5)*sin(5*pi*xL);
f7 = bN(7)*sin(7*pi*xL);
f9 = bN(9)*sin(9*pi*xL);

f = f1 + f3 + f5 + f7 + f9;

plot(xL,f)