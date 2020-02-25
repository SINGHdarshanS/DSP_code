syms b1 b2 b3 x n v p

[sol1, sol2, sol3] = solve((2*b1*cos(.1*pi)+2*b2*cos(.05*pi)+b3==0),(2*b1*cos(.2*pi)+2*b2*cos(.1*pi)+b3==1), (2*b1*cos(.4*pi)+2*b2*cos(.2*pi)+b3==0));


p(n) = sin(.05*pi*n)+sin(.2*pi*n);
v(n) = sin(.1*pi*n)+sin(.05*pi*n)+sin(.2*pi*n);
h = [double(sol1), double(sol2), double(sol3), double(sol2), double(sol1)];
y = filter(h, 1, double(v(0:100)));
pn = filter(h, 1, double(p(0:100)));
figure
hold on
fplot(sin(.1*pi*n), [0 100], 'b-')%this is s(n)
%fplot(sin(.05*pi*n)+sin(.2*pi*n), [0 100]) %this is v(n)
fplot(sin(.1*pi*n)+sin(.05*pi*n)+sin(.2*pi*n), [0 100], 'g--')%this is x(n)
plot((0:100),y, 'r-')
ylim([-3 3]);
%plot(0:100,filter(h, 1, v));

title('input and output signals')
xlabel('time samples, n')
legend('x(n)', 's(n)', 'y(n)')

hold off

%%part 1.4
fprintf('n    s(n)    s(n-2)    y(n)    v(n)    y_v(n)\n')
fprintf('---------------------------------------------\n')
k = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
P = [k;sin(.1*pi*k);sin(.1*pi*(k-2));filter(h, 1, double(v(0:9)));sin(.05*pi*k)+sin(.2*pi*k); filter(h, 1, double(p(0:9)))];
P(3,1) = 0;
P(3,2) = 0;
fprintf('%d   %6.4f   %6.4f   %6.4f   %6.4f   %6.4f\n',P)