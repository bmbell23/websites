clear; clc; 

%%% Part A: Calculate Frequency Response

W = [0 5 10 20 30 50 70 inf];

for i = 1:length(W)
   
    w = W(i);
    
m(i) = sqrt(1/((1-w^2).^2+(0.7*w).^2));

mdb(i) = 20*log10(m(i));

phi(i) = -(pi+atan(0.7*w/(1-w.^2)));

end

for i = 1:length(W)
    
    phideg(i) = rad2deg(phi(i));
    
end

mat2(:,1)= W';
mat2(:,2)= m';
mat2(:,3)= mdb';
mat2(:,4)= phideg';

tab = ('  w (rad/s)   m        mdB      phi (deg)');

disp(tab)
disp(mat2)


%% Part B: Plot the Results in Polar Form

figure(1)
subplot(2,1,1)
semilogx(W,mdb)
axis([1e-2 1e2 -80 20])
title('Magnitude (dB)')

subplot(2,1,2)
semilogx(W,phideg)
axis([1e-2 1e2 -182 0])
title('Phase Angle (deg)')

%% Part C: Verify with MATLAB

TF = tf([1],[1 0.7 1]);

figure(2)
bode(TF)

figure(3)
nyquist(TF)

