
%part 1
dom1 = linspace(0,pi,999);
w0 = .2*pi;
w1 = .3*pi;
B = .1;

H = @(x) double((1i*B*sin(x))./(cos(x)-cos(w0)+1i*B*sin(x)));
hm = real(H(dom1));

l = acos((cos(w0)+B*sqrt(((B)^2)+(sin(w0))^2))/(1+(B)^2));
r = acos((cos(w0)-B*sqrt(((B)^2)+(sin(w0))^2))/(1+(B)^2));

figure
plot(dom1/pi, hm)
hold on

plot(w0/pi, H(w0), 'ro')
plot(w1/pi, H(w1), 'rs')

plot([l/pi, r/pi], [H(l), H(r)], 'r-');

title('peak filter, w1 = 0.05pi')
xlabel('w/pi')
ylabel('magnitude')
legend('|H(jw)|','Peak', 'Side', '3-dB width')

hold off

%part 2
dom2 = linspace(0,pi,1001);
H = @(x) (-1./x).*atan((cos(x)-cos(w0))./(B*sin(x)));
p = H(dom2);
figure
plot(dom2/pi,p)
hold on
ylim([-12,4])
Tw1 = H(w1);
plot(w0/pi,H(w0), 'ro')
plot(w1/pi, H(w1), 'rs')

title('phase delay, T(w) = -arg(H(w))/w')
xlabel('w/pi')
ylabel('T(w)')
legend('T(w)', 'Peak', 'Side')
hold off

%part 3
dom3 = linspace(0,100);

x = @(n) sin(w1*n);
b = (B/(1+B))*[1,0,-1];
a = [1, -(2*cos(w0))/(1+B), (1-B)/(1+B)];
y = filter(b,a,x(dom3));

figure
set(stem(dom3,x(dom3)), 'Marker', 'none')
hold on
stPlot = stem(dom3,y);
set(stPlot, 'Marker', 'none')
title('input and output signals')
xlabel('time samples, n')
legend('x(n)', 'y(n)')
hold off

figure
hold on
plot(dom3,x(dom3))
plot(dom3,y)
title('input and output signals')
xlabel('time samples, n')
legend('x(n)', 'y(n)')
hold off

%finished