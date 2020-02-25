b = [0.984011,-3.535954,5.113142,-3.535954,0.984011];
a = [1,-3.557832,5.093644,-3.487380,0.960788];
dom = linspace(0,pi,9999);
Hz = abs(freqz(b,a,dom));

w1 = .05*pi;
w2 = .1*pi;
w3 = .2*pi;

hnum1 = b(1)+b(2)*exp(w1*1i)+b(3)*exp(w1*1i)^2+b(4)*exp(w1*1i)^3+b(5)*exp(w1*1i)^4;
hden1 = a(1)+a(2)*exp(w1*1i)+a(3)*exp(w1*1i)^2+a(4)*exp(w1*1i)^3+a(5)*exp(w1*1i)^4;
hnum2 = b(1)+b(2)*exp(w2*1i)+b(3)*exp(w2*1i)^2+b(4)*exp(w2*1i)^3+b(5)*exp(w2*1i)^4;
hden2 = a(1)+a(2)*exp(w2*1i)+a(3)*exp(w2*1i)^2+a(4)*exp(w2*1i)^3+a(5)*exp(w2*1i)^4;
hnum3 = b(1)+b(2)*exp(w3*1i)+b(3)*exp(w3*1i)^2+b(4)*exp(w3*1i)^3+b(5)*exp(w3*1i)^4;
hden3 = a(1)+a(2)*exp(w3*1i)+a(3)*exp(w3*1i)^2+a(4)*exp(w3*1i)^3+a(5)*exp(w3*1i)^4;

h1 = abs(hnum1/(hden1));
h2 = abs((hnum2/hden2));
h3 = abs((hnum3/hden3));

figure
plot(dom/pi,Hz);
hold on
plot(.05, h1, 'r*');
plot(.1, h2, 'r*');
plot(.2, h3, 'r*');

title('cascade of IIR notch filters')
xlabel('w/pi')
ylabel('magnitude')
legend('|H(w)|','w1, w2, w3')

hold off