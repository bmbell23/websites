% Kevin Smiley, Alex Riley, Jared Strutton, Jason Tucker
% MAE 4120 Project 1
% 9/8/2015

clc;clear all;format long
% Calculates Position, Velocity, and Acceleration for any point on a
% Grashof condition fourbar linkage given the link lengths

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Input Parameters

start_angle = 0; %Start Angle for analysis
end_angle = 360;   %End angle for analysis
h = .1;             %Step Size for Angle Incrementation
theta2 = start_angle:h:end_angle;
omega2 =25;       %Angular Velocity of driver link (Link 2)
alpha2 = -4;        %Angular Acceleration of driver link (Link 2)
a = 2.5;         %Link 2 Length
b = 1;             %Link 3 Length
c = 2.5;           %Link 4 Length
d = 2;          %Link 1 Length
p =  5;          %Distance from point A to coupler point
PHI = 45;          %Angle of coupler point from link 3
Orientation = 1;   %Enter 1=Open, 2=Crossed

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Position Analysis
% theta2 = start_angle:h:end_angle;
K1 = d/a;
K2 = d/c;
K3 = ((a^2)-(b^2)+(c^2)+(d^2))/(2*a*c);
K4 = d/b;
K5 = ((c^2)-(d^2)-(a^2)-(b^2))/(2*a*b);

A = cosd(theta2)-K1-(K2*cosd(theta2))+K3;
B = -2*sind(theta2);
C = K1-((K2+1)*cosd(theta2))+K3;
D = cosd(theta2)-K1+(K4*cosd(theta2))+K5;
E = -2*sind(theta2);
F = K1+((K4-1)*cosd(theta2))+ K5;

num3_1 = -E-sqrt((E.^2)-(4.*D.*F));
num3_2 = -E+sqrt((E.^2)-(4.*D.*F));
den3 = 2*D;

num4_1 = -B-sqrt((B.^2)-(4.*A.*C));
num4_2 = -B+sqrt((B.^2)-(4.*A.*C));
den4 = 2*A;

theta3_1 = 2*atand(num3_1./den3);
theta3_2 = 2*atand(num3_2./den3);
theta4_1 = 2*atand(num4_1./den4);
theta4_2 = 2*atand(num4_2./den4);

% Position Results
PA_x = a*cosd(theta2);
PA_y = a*sind(theta2);
PB_1_x = b*cosd(theta3_1)+PA_x ;
PB_1_y = b*sind(theta3_1)+PA_y ;
PB_2_x = b*cosd(theta3_2)+PA_x ;
PB_2_y = b*sind(theta3_2)+PA_y ;
PPA_1_x = p*cosd(theta3_1+PHI) ;
PPA_1_y = p*sind(theta3_1+PHI) ;
PPA_2_x = p*cosd(theta3_2+PHI) ;
PPA_2_y = p*sind(theta3_2+PHI) ;
PP_1_x = PPA_1_x + PA_x;
PP_1_y = PPA_1_y + PA_y;
PP_2_x = PPA_2_x + PA_x;
PP_2_y = PPA_2_y + PA_y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Velocity Analysis

omega3_1 = (a*omega2.*sind(theta4_1-theta2))./(b*sind(theta3_1-theta4_1));
omega3_2 = (a*omega2.*sind(theta4_2-theta2))./(b*sind(theta3_2-theta4_2));
omega4_1 = (a*omega2.*sind(theta2-theta3_1))./(c*sind(theta4_1-theta3_1));
omega4_2 = (a*omega2.*sind(theta2-theta3_2))./(c*sind(theta4_2-theta3_2));

% Velocity Results
VA = a*omega2.*(-sind(theta2)+(1i*cosd(theta2)));
VA_x = real(VA);
VA_y = imag(VA);
VA_mag = abs(VA);
VA_ang = angle(VA)*(180/pi);

VBA_1 = b*omega3_1.*(-sind(theta3_1)+(1i*cosd(theta3_1)));
VBA_1_x = real(VBA_1);
VBA_1_y = imag(VBA_1);
VBA_1_mag = abs(VBA_1);
VBA_1_ang = angle(VBA_1)*(180/pi);

VBA_2 = b*omega3_2.*(-sind(theta3_2)+(1i*cosd(theta3_2)));
VBA_2_x = real(VBA_2);
VBA_2_y = imag(VBA_2);
VBA_2_mag = abs(VBA_2);
VBA_2_ang = angle(VBA_2)*(180/pi);

VB_1 = c*omega4_1.*(-sind(theta4_1)+(1i*cosd(theta4_1)));
VB_1_x = real(VB_1);
VB_1_y = imag(VB_1);
VB_1_mag = abs(VB_1);
VB_1_ang = angle(VB_1)*(180/pi);

VB_2 = c*omega4_2.*(-sind(theta4_2)+(1i*cosd(theta4_2)));
VB_2_x = real(VB_2);
VB_2_y = imag(VB_2);
VB_2_mag = abs(VB_2);
VB_2_ang = angle(VB_2)*(180/pi);

VPA_1 = p*omega3_1.*(-sind(theta3_1+PHI)+(1i*cosd(theta3_1+PHI)));
VPA_1_x = real(VPA_1);
VPA_1_y = imag(VPA_1);
VPA_1_mag = abs(VPA_1);
VPA_1_ang = angle(VPA_1)*(180/pi);

VPA_2 = p*omega3_2.*(-sind(theta3_2+PHI)+(1i*cosd(theta3_2+PHI)));
VPA_2_x = real(VPA_2);
VPA_2_y = imag(VPA_2);
VPA_2_mag = abs(VPA_2);
VPA_2_ang = angle(VPA_2)*(180/pi);

VP_1 = VPA_1+VA;
VP_1_x = real(VP_1);
VP_1_y = imag(VP_1);
VP_1_mag = abs(VP_1);
VP_1_ang = angle(VP_1)*(180/pi);

VP_2 = VPA_2+VA;
VP_2_x = real(VP_2);
VP_2_y = imag(VP_2);
VP_2_mag = abs(VP_2);
VP_2_ang = angle(VP_2)*(180/pi);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Acceleration Analysis
A1 = c*sind(theta4_1);
A2 = c*sind(theta4_2);
B1 = b*sind(theta3_1);
B2 = b*sind(theta3_2);
C1 = (a*alpha2.*sind(theta2))+(a*(omega2.^2).*cosd(theta2))+(b*(omega3_1.^2).*cosd(theta3_1))- (c*(omega4_1.^2).*cosd(theta4_1));
C2 = (a*alpha2.*sind(theta2))+(a*(omega2.^2).*cosd(theta2))+(b*(omega3_2.^2).*cosd(theta3_2))- (c*(omega4_2.^2).*cosd(theta4_2));
D1 = c*cosd(theta4_1);
D2 = c*cosd(theta4_2);
E1 = b*cosd(theta3_1);
E2 = b*cosd(theta3_2);
F1 = (a*alpha2.*cosd(theta2))-(a*(omega2.^2)*sind(theta2))-(b*(omega3_1.^2).*sind(theta3_1))+ (c*(omega4_1.^2).*sind(theta4_1));
F2 = (a*alpha2.*cosd(theta2))-(a*(omega2.^2)*sind(theta2))-(b*(omega3_2.^2).*sind(theta3_2))+ (c*(omega4_2.^2).*sind(theta4_2));

alpha3_1 = ((C1.*D1)-(A1.*F1))./((A1.*E1)-(B1.*D1));
alpha3_2 = ((C2.*D2)-(A2.*F2))./((A2.*E2)-(B2.*D2));
alpha4_1 = ((C1.*E1)-(B1.*F1))./((A1.*E1)-(B1.*D1));
alpha4_2 = ((C2.*E2)-(B2.*F2))./((A2.*E2)-(B2.*D2));

% Acceleration Results
AA = (a*alpha2.*((-sind(theta2))+(1i*cosd(theta2)))) - (a*(omega2.^2).*((cosd(theta2))+(1i*sind(theta2))));
AA_x = real(AA);
AA_y = imag(AA);
AA_mag = abs(AA);
AA_ang = angle(AA)*(180/pi);

ABA_1 = (b*alpha3_1.*((-sind(theta3_1))+(1i*cosd(theta3_1)))) - (b*(omega3_1.^2).*((cosd(theta3_1))+(1i*sind(theta3_1))));
ABA_1_x = real(ABA_1);
ABA_1_y = imag(ABA_1);
ABA_1_mag = abs(ABA_1);
ABA_1_ang = angle(ABA_1)*(180/pi);

ABA_2 = (b*alpha3_2.*((-sind(theta3_2))+(1i*cosd(theta3_2)))) - (b*(omega3_2.^2).*((cosd(theta3_2))+(1i*sind(theta3_2))));
ABA_2_x = real(ABA_2);
ABA_2_y = imag(ABA_2);
ABA_2_mag = abs(ABA_2);
ABA_2_ang = angle(ABA_2)*(180/pi);

AB_1 = (c*alpha4_1.*((-sind(theta4_1))+(1i*cosd(theta4_1)))) - (c*(omega4_1.^2).*((cosd(theta4_1))+(1i*sind(theta4_1))));
AB_1_x = real(AB_1);
AB_1_y = imag(AB_1);
AB_1_mag = abs(AB_1);
AB_1_ang = angle(AB_1)*(180/pi);

AB_2 = (c*alpha4_2.*((-sind(theta4_2))+(1i*cosd(theta4_2)))) - (c*(omega4_2.^2).*((cosd(theta4_2))+(1i*sind(theta4_2))));
AB_2_x = real(AB_2);
AB_2_y = imag(AB_2);
AB_2_mag = abs(AB_2);
AB_2_ang = angle(AB_2)*(180/pi);

APA_1 = (p*alpha3_1.*(-sind(theta3_1+PHI)+(1i*cosd(theta3_1+PHI)))) - (p*(omega3_1.^2).*(cosd(theta3_1+PHI)+(1i*sind(theta3_1+PHI))));
APA_1_x = real(APA_1);
APA_1_y = imag(APA_1);
APA_1_mag = abs(APA_1);
APA_1_ang = angle(APA_1)*(180/pi);

APA_2 = (p*alpha3_2.*(-sind(theta3_2+PHI)+(1i*cosd(theta3_2+PHI)))) - (p*(omega3_2.^2).*(cosd(theta3_2+PHI)+(1i*sind(theta3_2+PHI))));
APA_2_x = real(APA_2);
APA_2_y = imag(APA_2);
APA_2_mag = abs(APA_2);
APA_2_ang = angle(APA_2)*(180/pi);

AP_1 = AA_x + APA_1_x + 1i*(AA_y + APA_1_y);
AP_1_x = real(AP_1);
AP_1_y = imag(AP_1);
AP_1_mag = abs(AP_1);
AP_1_ang = angle(AP_1)*(180/pi);

AP_2 = AA_x + APA_2_x + 1i*(AA_y + APA_2_y);
AP_2_x = real(AP_2);
AP_2_y = imag(AP_2);
AP_2_mag = abs(AP_2);
AP_2_ang = angle(AP_2)*(180/pi);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot the Results (Varying Theta 2)

%Visualize Linkage Motion
figure(1);clf
plot([0,PA_x,PP_1_x,PB_1_x,d],[0,PA_y,PP_1_y,PB_1_y,0],'bx');hold on
plot([0,PA_x,PP_2_x,PB_2_x,d],[0,PA_y,PP_2_y,PB_2_y,0],'rx')
legend('Open','Crossed','Location','Best')
axis square
xlabel('X Position (a.u.)')
ylabel('Y Position (a.u.)')

%Plot Remaining Information
if Orientation == 1
    figure(2);clf
    plot(theta2,PA_x,'r-','Linewidth',2);hold on
    plot(theta2,PP_1_x,'g-','Linewidth', 2)
    plot(theta2,PB_1_x,'b-','Linewidth',2)
    xlabel('\theta_2 (degrees)')
    ylabel('Position X (a.u.)')
    title('Position vs. Input Angle')
    legend('A','P','B')
    
    figure(3);clf
    plot(theta2,PA_y,'r-','Linewidth',2);hold on
    plot(theta2,PP_1_y,'g-','Linewidth', 2)
    plot(theta2,PB_1_y,'b-','Linewidth',2)
    xlabel('\theta_2 (degrees)')
    ylabel('Position Y (a.u.)')
    title('Position vs. Input Angle')
    legend('A','P','B')
    
    figure(4);clf
    plot(theta2,VA_mag,'r-','Linewidth',2);hold on
    plot(theta2,VP_1_mag,'g-','Linewidth', 2)
    plot(theta2,VB_1_mag,'b-','Linewidth',2)
    xlabel('\theta_2 (degrees)')
    ylabel('Velocity Magnitude (a.u./s)')
    title('Velocity Magnitude vs. Input Angle')
    legend('A','P','B')
    
    figure(5);clf
    plot(theta2,AA_mag,'r-','Linewidth',2);hold on
    plot(theta2,AP_1_mag,'g-','Linewidth', 2)
    semilogy(theta2,AB_1_mag,'b-','Linewidth',2)
    xlabel('\theta_2 (degrees)')
    ylabel('Acceleration Magnitude (a.u./s^2)')
    title('Acceleration Magnitude vs. Input Angle')
    legend('A','P','B')
    
    figure(6);clf
    plot(PA_x,PA_y,'r-','Linewidth',2);hold on
    plot(PP_1_x,PP_1_y,'g-','Linewidth', 2)
    plot(PB_1_x,PB_1_y,'b-','Linewidth',2)
    xlabel('X Position (a.u.)')
    ylabel('Y Position (a.u.)')
    title('Position')
    legend('A','P','B')
    
    figure(7);clf
    plot(VA_x,VA_y,'r-','Linewidth',2);hold on
    plot(VP_1_x,VP_1_y,'g-','Linewidth', 2)
    plot(VB_1_x,VB_1_y,'b-','Linewidth',2)
    xlabel('X Velocity (a.u./s)')
    ylabel('Y Velocity (a.u./s)')
    title('Velocity')
    legend('A','P','B')
    
    figure(8);clf
    plot(AA_x,AA_y,'r-','Linewidth',2);hold on
    plot(AP_1_x,AP_1_y,'g-','Linewidth', 2)
    plot(AB_1_x,AB_1_y,'b-','Linewidth',2)
    xlabel('X Acceleration (a.u./s^2)')
    ylabel('Y Acceleration (a.u./s^2)')
    title('Acceleration')
    legend('A','P','B')
    
elseif Orientation ==2
    figure(2);clf
    plot(theta2,PA_x,'r-','Linewidth',2);hold on
    plot(theta2,PP_2_x,'g-','Linewidth', 2)
    plot(theta2,PB_2_x,'b-','Linewidth',2)
    xlabel('\theta_2 (degrees)')
    ylabel('Position X (a.u.)')
    title('Position vs. Input Angle')
    legend('A','P','B')
    
    figure(3);clf
    plot(theta2,PA_y,'r-','Linewidth',2);hold on
    plot(theta2,PP_2_y,'g-','Linewidth', 2)
    plot(theta2,PB_2_y,'b-','Linewidth',2)
    xlabel('\theta_2 (degrees)')
    ylabel('Position Y (a.u.)')
    title('Position vs. Input Angle')
    legend('A','P','B')
    
    figure(4);clf
    plot(theta2,VA_mag,'r-','Linewidth',2);hold on
    plot(theta2,VP_2_mag,'g-','Linewidth', 2)
    plot(theta2,VB_2_mag,'b-','Linewidth',2)
    xlabel('\theta_2 (degrees)')
    ylabel('Velocity Magnitude (a.u./s)')
    title('Velocity Magnitude vs. Input Angle')
    legend('A','P','B')
    
    figure(5);clf
    plot(theta2,AA_mag,'r-','Linewidth',2);hold on
    plot(theta2,AP_2_mag,'g-','Linewidth', 2)
    plot(theta2,AB_2_mag,'b-','Linewidth',2)
    xlabel('\theta_2 (degrees)')
    ylabel('Acceleration Magnitude (a.u./s^2)')
    title('Acceleration Magnitude vs. Input Angle')
    legend('A','P','B')
    
    figure(6);clf
    plot(PA_x,PA_y,'r-','Linewidth',2);hold on
    plot(PP_2_x,PP_2_y,'g-','Linewidth', 2)
    plot(PB_2_x,PB_2_y,'b-','Linewidth',2)
    xlabel('X Position (a.u.)')
    ylabel('Y Position (a.u.)')
    title('Position')
    legend('A','P','B')
    
    figure(7);clf
    plot(VA_x,VA_y,'r-','Linewidth',2);hold on
    plot(VP_2_x,VP_2_y,'g-','Linewidth', 2)
    plot(VB_2_x,VB_2_y,'b-','Linewidth',2)
    xlabel('X Velocity (a.u./s)')
    ylabel('Y Velocity (a.u./s)')
    title('Velocity')
    legend('A','P','B')
    
    figure(8);clf
    plot(AA_x,AA_y,'r-','Linewidth',2);hold on
    plot(AP_2_x,AP_2_y,'g-','Linewidth', 2)
    plot(AB_2_x,AB_2_y,'b-','Linewidth',2)
    xlabel('X Acceleration (a.u./s^2)')
    ylabel('Y Acceleration (a.u./s^2)')
    title('Acceleration')
    legend('A','P','B')
else
    error('ERROR. Check your input parameters')
end


