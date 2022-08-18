%% Brandon M. Bell - Homework 6 - Question 2

clf; clc; clc;
s=tf('s');

%%% Question 1A
figure(1)
GH = 1/((s^2+9)*(s));
rlocus(GH);

%%% Question 1B
figure(2)
GH = (s+10)/((s^2+9)*(s));
rlocus(GH);

%%% Question 1C
figure(3)
GH = (s+10)/((s^2+9)*(s+25));
rlocus(GH);

%%% Question 1D
figure(4)
GH = (s+10)/((s^2+9)*(s+25)*(s));
rlocus(GH);

%%% Question 1E
figure(5)
GH = (s+10)/((s^2+9)*(s+25)*(s)*(s+15));
rlocus(GH);
