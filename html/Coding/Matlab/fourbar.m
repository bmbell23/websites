function fourbar
%% SECTION 01: Defining the parameters for the system.

clear; clc; clf;
Type    =input('Would you like to use a preset linkage or make your own? Type 1 for preset, and 2 to make your own. ');

if Type == 1
    
    preset = input ('Would you like a Chebyshev, Grashof, or Non-Grashof linkage? Type 1, 2, or 3. ');
    
    if preset == 1
        
        a=2.5; b=1; c=a; d=2; p=0.5; td=0;   t21=37; t22=90;  n=1; w2=1;  a2=0;
        
    elseif preset == 2
        
        a=1; b=3; c=4; d=5;   p=2; td=45;    t21=45; t22=180; n=1; w2=10; a2=0;
        
    elseif preset == 3
        
        a=3; b=3; c=4; d=5;   p=2; td=45;    t21=45; t22=180; n=1; w2=10; a2=0;
        
    end
    
elseif Type == 2

        disp('First, let us define the lengths of each link.')
d       =input('What is the length of Link 1? ');
a       =input('What is the length of Link 2? ');
b       =input('What is the length of Link 3? ');
c       =input('What is the length of Link 4? ');
clc;    disp('Now, let us define the behavior of the angle between Links 1 and 2.')
t21     =input('What is the initial angle between Link 1 and Link 2? ');
t22     =input('What is the final angle between Link 1 and Link 2? ');
n       =input('What is the step size would you like between these angles? ');
w2      =input('What is the initial angular velocity at this angle? ');
a2      =input('What is the initial angular accelleration at this angle? ');
clc;    disp('Now, let us define what point you are interested in.')
p       =input('What is the distance between point P and point A? ');
td      =input('What is the angle between Link 3 and point P? ');
    
end

loop    =input('Do you want to use the open loop or closed loop configuration? Type 1 for Open Loop and 2 for Closed Loop. ' );
t2 = t21:n:t22;

%% SECTION 02: Calculating Angle Matricies.

k1  = d/a;
k2  = d/c;
k3  = (a^2-b^2+c^2+d^2)/(2*a*c);
k4  = d/b;
k5  = (c^2-d^2-a^2-b^2)/(2*a*b);

A   = cosd(t2)-k1-k2*cosd(t2)+k3;
B   = -2*sind(t2);
C   = k1-(k2+1)*cosd(t2)+k3;
D   = cosd(t2)-k1+k4*cosd(t2)+k5;
E   = -2*sind(t2);
F   = k1+(k4-1)*cosd(t2)+k5;

%% SECTION 03: Determining Angles for Open Loop or Closed Loop.

if loop == 1
    
    %The Open Loop Angles Theta 3 and Theta 4
    t4 = 2.*atand((-B+sqrt(B.^2-4.*A.*C))./(2.*A));
    t3 = 2.*atand((-E+sqrt(E.^2-4.*D.*F))./(2.*D));
    
elseif loop ==2
    
    %The Closed Loop Angles Theta 3 and Theta 4
    t4 = 2.*atand((-B-sqrt(B.^2-4.*A.*C))./(2.*A));
    t3 = 2.*atand((-E-sqrt(E.^2-4.*D.*F))./(2.*D));
    
end

for i=1:length(t3)
    if t3(:,i) < 0
        t3(:,i)= 360+t3(:,i);
    end
end

for i=1:length(t4)
    if t4(:,i) < 0
        t4(:,i)= 360+t4(:,i);
    end
end

%% SECTION 04: Determining Positions of points A, B, and P

Ra  = a.*(cosd(t2)+1i.*sind(t2));
Rb  = c.*(cosd(t4)+1i.*sind(t4));
Rpa = p.*(cosd(t3+td)+1i.*sind(t3+td));
Rp  = Rpa + Ra;

%% SECTION 05: Determining Angular Velocities

w3  = ((a*w2)/b).*((sind(t4-t2)./sind(t3-t4)));
w4  = ((a*w2)/c).*((sind(t2-t3)./sind(t4-t3)));

%% SECTION 06: Determining Velocitiest of point A, B, and P

Va  = a.*w2.*(-sind(t2)+1i.*cosd(t2));
Vba = b.*w3.*(-sind(t3)+1i.*cosd(t3));
Vb  = c.*w4.*(-sind(t4)+1i.*cosd(t4));
Vpa = p.*w3.*(-sind(t3+td)+1i.*cosd(t3+td));
Vp  = Vpa + Va;

%% SECTION 07: Determining Angular Accelerations

    % Calculating constants for the angular accelerations.
    A   = c.*sind(t4);
    B   = b.*sind(t3);
    C   = a*a2.*sind(t2) + a*(w2.^2).*cosd(t2) + ...
        b*(w3.^2).*cosd(t3) - c*(w4.^2).*cosd(t4);
    D   = c.*cosd(t4);
    E   = b.*cosd(t3);
    F   = a*a2.*cosd(t2) - a*(w2.^2).*sind(t2) - ...
        b*(w3.^2).*sind(t3) + c*(w4.^2).*sind(t4);
    
    % Calculating the angular accelerations.
    a3  = (C.*D - A.*F)/(A.*E - B.*D);
    a4  = (C.*E - B.*F)/(A.*E - B.*D);
    
%% SECTION 08: Determining Accelerations of point A, B, and P

Aa  = a.*a2.*((-sind(t2)+1i.*cosd(t2)) - a.*(w2.^2).*(cosd(t2)+1i.*sind(t2)));
Aba = b.*a3.*((-sind(t3)+1i.*cosd(t3)) - b.*(w2.^2).*(cosd(t3)+1i.*sind(t3)));
Ab  = Aa + Aba;
Apa = p.*(a3.*(-sind(t3+td)+1i.*cosd(t3+td)) - (w3.^2).*(cosd(t3+td)+1i.*sind(t3+td)));
Ap  = Aa + Apa;

%% SECTION 09: (FIG 01) Plotting the Coupler Curve for Point P
figure(1)
plot(-real(Rp),imag(Rp))
title('Coupler Curve for Point P')
ylabel('Position in the y-direction')
xlabel('Position in the x-direction')

%% SECTION 10: (FIG 02) Plotting Coupler Point Coordinates
figure(2)
subplot(4,1,1)
plot(t2,real(Rp))
ylabel('Coupler Pt X (in)')
title('Coupler Point Coordinates')

subplot(4,1,2)
plot(t2,imag(Rp))
ylabel('Coupler Pt Y (in)')

subplot(4,1,3)
plot(t2,abs(Rp))
ylabel('Coupler Pt Mag (in)')

subplot(4,1,4)
plot(t2,t3)
ylabel('Coupler Pt Ang (in)')
xlabel('Input Angle (Deg)')

%% SECTION 11: (FIG 03) Plotting Theta Magnitudes for All Links
figure(3)
subplot(3,1,1)
plot(t2,real(t2))
ylabel('Theta2 Ang (deg)')
title('Theta Magnitudes for All Links')

subplot(3,1,2)
plot(t2,real(t3))
ylabel('Theta3 Ang (deg)')

subplot(3,1,3)
plot(t2,real(t4))
ylabel('Theta4 Ang (deg)')
xlabel('Input Angle (Deg)')

%% SECTION 12: (FIG 04) Plotting Omega Magnitudes for All Links
figure(4)
subplot(4,1,1)
plot(t2,abs(w2))
ylabel('Omega2 Mag (rad/sec)')
title('Omega Magnitudes for All Links')

subplot(4,1,2)
plot(t2,abs(w3))
ylabel('Omega3 Mag (rad/sec)')

subplot(4,1,3)
plot(t2,abs(w4))
ylabel('Omega4 Mag (rad/sec)')

subplot(4,1,4)
plot(t2,abs(w4)./abs(w2))
ylabel('w4/w2 Mag (rad/sec)')
xlabel('Input Angle (Deg)')

%% SECTION 13: (FIG 05) Position, Velocity, and Acceleration for Point P
figure(5)
subplot(3,1,1)
plot(t2,Rp)
ylabel('Position CP Mag (in)')
title('Position, Velocity, and Acceleration of Point P')

subplot(3,1,2)
plot(t2,-Vp)
ylabel('Veloc CP Mag (in/sec)')

subplot(3,1,3)
plot(t2,Ap)
ylabel('Accel CP Mag (in/sec^2)')
xlabel('Input Angle (Deg)')

%% SECTION 14: (FIG 06) Position, Velocity, and Acceleration for Point A
figure(6)
subplot(3,1,1)
plot(t2,Ra)
ylabel('Position CP Mag (in)')
title('Position, Velocity, and Acceleration of Point A')

subplot(3,1,2)
plot(t2,-Va)
ylabel('Veloc CP Mag (in/sec)')

subplot(3,1,3)
plot(t2,Aa)
ylabel('Accel CP Mag (in/sec^2)')
xlabel('Input Angle (Deg)')

%% SECTION 15: (FIG 07) Position, Velocity, and Acceleration for Point B
figure(7)
subplot(3,1,1)
plot(t2,Rb)
ylabel('Position CP Mag (in)')
title('Position, Velocity, and Acceleration of Point B')

subplot(3,1,2)
plot(t2,-Vb)
ylabel('Veloc CP Mag (in/sec)')

subplot(3,1,3)
plot(t2,Ab)
ylabel('Accel CP Mag (in/sec^2)')
xlabel('Input Angle (Deg)')

end