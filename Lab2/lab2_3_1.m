dom = linspace(0,2);
x = cos(2*pi*dom)+cos(8*pi*dom)+cos(12*pi*dom);
xa = 3*cos(2*pi*dom);

n=0:1:10;
xT = cos(2/5*pi*n)+cos(8/5*pi*n)+cos(12/5*pi*n);

figure
hold on
plot(dom,x, 'r--');
plot(dom,xa, 'bl-');
plot(n/5,xT,'b.');
legend('original','aliased','samples')

xlabel('t (msec)')
ylabel('x(t), xa(t)')
title('fs= 5 kHz')
hold off
%finished