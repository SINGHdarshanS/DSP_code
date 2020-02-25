dom = linspace(0,2);
x = cos(2*pi*dom)+cos(8*pi*dom)+cos(12*pi*dom);
xa = cos(2*pi*dom)+2*cos(8*pi*dom);

n=0:1:10;
xT = cos(2/10*pi*n)+cos(8/10*pi*n)+cos(12/10*pi*n);

figure
hold on
plot(dom,x, 'r--');
plot(dom,xa, 'bl-');
plot(n/10,xT,'b.');
legend('original','aliased','samples')

xlabel('t (msec)')
ylabel('x(t), xa(t)')
title('fs= 10 kHz')
hold off
%finished