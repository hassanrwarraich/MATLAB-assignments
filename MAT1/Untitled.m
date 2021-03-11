%---------part1------
n = 0:1:30000;
t = n*0.0001;
x1 = sin(2*pi*440*t);
%soundsc(x1)
figure(1);
plot(t,x1);
title('Discrete Time Signal for  x1');
xlabel('t');
ylabel('x1');
xlim([0 0.01]);

x2 = sin(2*pi*554*t);
x22 = sin(2*pi*659*t);
%soundsc(x2);
%soundsc(x22);

n1 = 0:1:30000;
t = n*0.0001;
s = sin(2*pi*440*t) + sin(2*pi*554*t) + sin(2*pi*659*t);
figure(2);
%soundsc(s)
plot(t,s);
title('Discrete Time Signal for  s');
xlabel('t');
ylabel('s');
xlim([0 0.01]);

%---------part2------
p2 = cos(2*pi*587*t + pi);
figure(6);
plot(t,p2);
title('Discrete Time Signal for phase shift of pi');
xlabel('p2');
ylabel('s');
xlim([0 0.01]);
%soundsc(p2);

%---------part3------
x3 = (exp(-((3^2)+2)*t)).*(cos(2*pi*440*t));
figure(3);
plot(t,x3);
%soundsc(x3);
title('Discrete Time Signal for  x3');
xlabel('t');
ylabel('x3');

%---------part4------
x4 = (cos(2*pi*10*t)).*(cos(2*pi*1000*t));
%x4 = ((cos(2*pi*50*t + 2*pi*65*t))+(cos(2*pi*50*t - 2*pi*65*t)))/2
figure(4);
plot(t,x4);
%soundsc(x4);
title('Discrete Time Signal for  x4');
xlabel('t');
ylabel('x4');

n2 = 0:1:200;
t2 = n2*0.01;

%---------part5------
f0 = 2500;
%fi = 2*10*t + f0;
mu = (2500-500)/(2*2)
phi = 0;
x5 = cos(2*pi*mu*t2.*t2 + 2*pi*2500*t2 + phi);
soundsc(x5)
figure(5);
plot(t2,x5);
title('Discrete Time Signal for  x5');
xlabel('t');
ylabel('x1');
