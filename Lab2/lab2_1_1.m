syms b1 b2 b3 x n v p
[sol1, sol2, sol3] = solve((2*b1*cos(.1*pi)+2*b2*cos(.05*pi)+b3==0),(2*b1*cos(.2*pi)+2*b2*cos(.1*pi)+b3==1), (2*b1*cos(.4*pi)+2*b2*cos(.2*pi)+b3==0));

sol1
sol2
sol3
%finished