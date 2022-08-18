clear; clc; 

%%% Part A: Calculate Frequency Response

W = [0 5 10 20 30 50 70 999 inf];

for i = 1:length(W)
   
    w = W(i);
    
m(i) = sqrt(((0.02*w).^2+1)/((0.1*w).^2+1));

mdb(i) = 20*log10(m(i));

phi(i) = atan(0.02*w) - atan(0.1*w);

end

for i = 1:length(W)
    
    phideg(i) = rad2deg(phi(i));
    
end

mat1(:,1)= W';
mat1(:,2)= m';
mat1(:,3)= mdb';
mat1(:,4)= phideg';

tab = ('  w (rad/s)   m        mdB      phi (deg)');

disp(tab)
disp(mat1)

%%% Part B: Plot the Results in Polar Form

figure(1)
subplot(2,1,1)
semilogx(W,mdb)
axis([1e-1 1e3 -14 0])
title('Magnitude (dB)')

subplot(2,1,2)
semilogx(W,phideg)
axis([1e-1 1e3 -60 0])
title('Phase Angle (deg)')

%%% Part C: Verify with MATLAB

TF = tf([0.02 1],[0.1 1]);

figure(2)
bode(TF)

figure(3)
nyquist(TF)
