dom = linspace(0,pi,999);
w0 = .2*pi;
w1 = .05*pi;
B = .1;

H = @(dom) double((1i*B*sin(dom))./(cos(dom)-cos(w0)+1i*B*sin(dom)));
hm = real(H(dom));

l = acos((cos(w0)+B*sqrt(((B)^2)+(sin(w0))^2))/(1+(B)^2));
r = acos((cos(w0)-B*sqrt(((B)^2)+(sin(w0))^2))/(1+(B)^2));

figure
plot(dom/pi, hm)
hold on

plot(w0/pi, H(w0), 'ro')
plot(w1/pi, H(w1), 'rs')

plot([l/pi, r/pi], [H(l), H(r)], 'r-');

title('peak filter, w1 = 0.05pi')
xlabel('w/pi')
ylabel('magnitude')
legend('|H(jw)|','Peak', 'Side', '3-dB width')

hold off