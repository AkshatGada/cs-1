t = 0:0.01:10;
a = sin(t);

[sqnr8, aquan8] = u_pcm(a, 8);
[sqnr16, aquan16] = u_pcm(a, 16);

disp(sqnr8);
disp(sqnr16);

plot(t, a, '-', t, aquan8, '-', t, aquan16, '-', t, zeros(size(t)));
legend('Original signal', '8-level quantized signal', '16-level quantized signal');

function [sqnr, a_quan] = u_pcm(a, n)
    amax = max(abs(a));
    a_quan = a / amax;
    
    d = 2 / n;
    q = d * (0:n-1) - (n-1)/2 * d;
    
    for i = 1:n
        indices = abs(a_quan - q(i)) <= d/2;
        a_quan(indices) = q(i);
        b_quan(indices) = i - 1;
    end
    
    a_quan = a_quan * amax;
    
    sqnr = 20 * log10(norm(a) / norm(a - a_quan));
end
