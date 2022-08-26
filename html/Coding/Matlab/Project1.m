%Input Parameters
d=input('Enter length for link 1...');
a=input('Enter length for link 2...');
b=input('Enter length for link 3...');
c=input('Enter length for link 4...');
Theta21=input('Enter beginning of angle range..');
Theta22=input('Enter end of angle range..');
n=input('Enter the number of degrees to step by...');
Theta2=Theta21:n:Theta22;
Omega2=input('Enter the angular velocity of Link 2...');
Alpha2=input('Enter acceleration of Link 2...');
Delta3=input('Enter the angle between link 3 and line formed from desired point to Point A...');
p=input('Enter the length from Point A to the desired point on Link 3...');

%Position Analysis
K1=d/a;
K2=d/c;
K3=(a^2-b^2+c^2+d^2)/(2*a*c);
K4=d/b;
K5=(c^2-d^2-a^2-b^2)/(2*a*b);

A=cosd(Theta2)-K1-K2*cosd(Theta2)+K3;
B=-2*sind(Theta2);
C=K1-(K2+1)*cosd(Theta2)+K3;
D=cosd(Theta2)-K1+K4*cosd(Theta2)+K5;
E=B;
F=K1+(K4-1)*cosd(Theta2)+K5;

Theta41=2.*atand((-B+sqrt(B.^2-(4.*A.*C)))./(2.*A))
Theta42=2.*atand((-B-sqrt(B.^2-(4.*A.*C)))./(2.*A))
Theta31=2.*atand((-E+sqrt(E.^2-(4.*D.*F)))./(2.*D))
Theta32=2.*atand((-E-sqrt(E.^2-(4.*D.*F)))./(2.*D))

RA=a*(cosd(Theta2)+i*sind(Theta2))
RB=b*(cosd(Theta31)+i*sind(Theta31))
RC=c*(cosd(Theta41)+i*sind(Theta41))
RAP=p*(cosd(Theta31+Delta3)+i*sind(Theta31+Delta3));
RP=RA+RAP

%Velocity Analysis
Omega31=((a*Omega2)/b)*(sind(Theta41-Theta2)/sind(Theta31-Theta41))
Omega41=((a*Omega2)/c)*(sind(Theta2-Theta31)/sind(Theta41-Theta31))

Omega32=((a*Omega2)/b)*(sind(Theta42-Theta2)/sind(Theta32-Theta42))
Omega42=((a*Omega2)/c)*(sind(Theta2-Theta32)/sind(Theta42-Theta32))

VA=a*Omega2*(-sind(Theta2)+i*cosd(Theta2))
VB=b*Omega31*(-sind(Theta31)+i*cosd(Theta31))
VC=c*Omega41*(-sind(Theta41)+i*cosd(Theta41))
VAP=p*Omega31*(-sind(Theta31+Delta3)+i*cosd(Theta31+Delta3));
VP=VA+VAP

%Acceleration Analysis
A1=c*sind(Theta41);
A2=c*sind(Theta42);
B1=b*sind(Theta31);
B2=b*sind(Theta32);
C1=a*Alpha2*sind(Theta2)+a*Omega2^2*cosd(Theta2)+b*Omega31^2*cosd(Theta31)-c*Omega41^2*cosd(Theta41);
C2=a*Alpha2*sind(Theta2)+a*Omega2^2*cosd(Theta2)+b*Omega32^2*cosd(Theta32)-c*Omega42^2*cosd(Theta42);
D1=c*cosd(Theta41);
D2=c*cosd(Theta42);
E1=b*cosd(Theta31);
E2=b*cosd(Theta32);
F1=a*Alpha2*cosd(Theta2)-a*Omega2^2*sind(Theta2)-b*Omega31^2*sind(Theta31)+c*Omega41^2*cosd(Theta41);
F2=a*Alpha2*cosd(Theta2)-a*Omega2^2*sind(Theta2)-b*Omega32^2*sind(Theta32)+c*Omega42^2*cosd(Theta42);

Alpha31=(C1.*D1-A1.*F1)./(A1.*E1-B1.*D1)
Alpha32=(C2.*D2-A2.*F2)./(A2.*E2-B2.*D2)

Alpha41=(C1.*E1-B1.*F1)./(A1.*E1-B1.*D1)
Alpha42=(C2.*E2-B2.*F2)./(A2.*E2-B2.*D2)

AA=a*Alpha2*(-sind(Theta2)+i*cosd(Theta2))-a*Omega2^2*(cosd(Theta2)+i*sind(Theta2))
AB=b*Alpha31*(-sind(Theta31)+i*cosd(Theta31))-b*Omega31^2*(cosd(Theta31)+i*sind(Theta31))
AC=c*Alpha41*(-sind(Theta41)+i*cosd(Theta41))-c*Omega41^2*(cosd(Theta41)+i*sind(Theta41))
AAP=p*Alpha31*(-sind(Theta31+Delta3)+i*cosd(Theta31+Delta3))-p*Omega31^2*(cosd(Theta31+Delta3)+i*sind(Theta31+Delta3));
AP=AA+AAP

Plot(RP)

