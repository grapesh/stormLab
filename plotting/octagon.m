function octagon (xo, yo, R, col)

t = (1/16:1/8:1)'*2*pi;
x = R*cos(t);
y = R*sin(t);
fill(xo+x, yo+y,col,'EdgeColor','none')
