clear all;
clc;
t = 0:0.01:10;
a = sin(t);
[sqnr, a_quan] = mula_pcm(a, 16, 255);
disp(sqnr);
plot(t, a, '-', t, a_quan, '-');

function [sqnr, a_quan] = mula_pcm(a, n, mu)
    [y, maximum] = mulaw(a, mu);
    [sqnr, y_q] = u_pcm(y, n);
    a_quan = invmulaw(y_q, mu) * maximum;
    sqnr = 20 * log10(norm(a) / norm(a - a_quan));
end

function [y, a] = mulaw(x, mu)
    a = max(abs(x));
    y = (log1p(mu * abs(x / a)) / log1p(mu)) .* sign(x);
end

function x = invmulaw(y, mu)
    x = (((1 + mu).^abs(y) - 1) / mu) .* sign(y);
end

function [sqnr, a_quan] = u_pcm(a, n)
    amax = max(abs(a));
    a_quan = a / amax;
    d = 2 / n;
    q = d * ((0:n-1) - (n-1)/2);
    for i = 1:n
        idx = abs(a_quan - q(i)) <= d/2;
        a_quan(idx) = q(i);
    end
    a_quan = a_quan * amax;
    sqnr = 20 * log10(norm(a) / norm(a - a_quan));
end
