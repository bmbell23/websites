clear; clc; 

w = [0 5 10 20 30 50 70];

for i = 1:7
   
    x = w(i);

m(i) = sqrt(((0.02*x).^2+1)/((0.1*x).^2+1));

mdb(i) = 20*log10(m(i));

phi(i) = atan(0.02*x) - atan(0.1*x);

end

for i = 1:7
    
    phideg(i) = rad2deg(phi(i));
    
end

mat(:,1)= m';
mat(:,2)= mdb';
mat(:,3)= phideg';

disp(mat)
