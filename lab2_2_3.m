dom = linspace(0,100);
w0 = .2*pi;
w1 = .05*pi;
B = .1;

x = @(n) sin(w1*n);
b = (B/(1+B))*[1,0,-1];
a = [1, -(2*cos(w0))/(1+B), (1-B)/(1+B)];
y = filter(b,a,x(dom));

figure
set(stem(dom,x(dom)), 'Marker', 'none')
hold on
stPlot = stem(dom,y);
set(stPlot, 'Marker', 'none')
title('input and output signals')
xlabel('time samples, n')
legend('x(n)', 'y(n)')
hold off

figure
hold on
plot(dom,x(dom))
plot(dom,y)
title('input and output signals')
xlabel('time samples, n')
legend('x(n)', 'y(n)')
hold off

%finished