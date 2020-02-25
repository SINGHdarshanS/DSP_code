w0 = .2*pi;
w1 = .05*pi;
B = .1;
dom = linspace(0,pi,1001);
H = @(x) (-1./x).*atan((cos(x)-cos(w0))./(B*sin(x)));
p = H(dom);
figure
plot(dom/pi,p)
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

%finished