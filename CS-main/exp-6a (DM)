a = 2;
t = 0:2*pi/50:2*pi;
x = a*sin(t);
l = length(x);

plot(x, 'r');
hold on;

delta = 0.2;
xn = zeros(1, l + 1);

for i = 1:l
    if x(i) > xn(i)
  
        xn(i+1) = xn(i) + delta;
    else

        xn(i+1) = xn(i) - delta;
    end
end

stairs(xn);
hold on;
legend('Analog signal', 'DM with step size=0.2');
title('DELTA MODULATION');
