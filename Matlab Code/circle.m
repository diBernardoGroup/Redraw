% Francesco Alderisio
% f.alderisio@bristol.ac.uk
% January 2015

function circle(x0,y0,r,color,fig)

% x0,y0: center pf the circle
% r: radius of the circle
% fig: figure number

ang = 0:0.01:2*pi; 
xp = r*cos(ang);
yp = r*sin(ang);

figure(fig);
plot(x0+xp,y0+yp,color,'LineWidth',1);

end