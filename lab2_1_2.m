syms b1 b2 b3 x n v p
%%part 1.1
[sol1, sol2, sol3] = solve((2*b1*cos(.1*pi)+2*b2*cos(.05*pi)+b3==0),(2*b1*cos(.2*pi)+2*b2*cos(.1*pi)+b3==1), (2*b1*cos(.4*pi)+2*b2*cos(.2*pi)+b3==0));

%%part 1.2 
figure
hold on
fplot(abs(exp(-2*1i*x)*(2*double(sol1)*cos(2*x)+2*double(sol2)*cos(x)+double(sol3))), [0 0.25*pi])

plot(0.05*pi,0, 'r*')
plot(0.1*pi,1, 'r*')
plot(0.2*pi,0, 'r*')

title('FIR notch filter')
xlabel('w/pi')
ylabel('magnitude')
legend('|H(w)|','w1, w2, w3')

hold off
%finished