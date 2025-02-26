td = 0.01; ts = 0.02; t = 0:td:5;
x = 8*sin(2*pi*t); delta = 0.1;
ADMout = adeltamod(x,delta,td,ts);

% Plot both ADM output and original signal
figure;
plot(t, ADMout, 'b', 'LineWidth', 1.5); % ADM output in blue
hold on;
plot(t, x, 'r--', 'LineWidth', 1.5); % Original signal in red dashed
hold off;

% Labeling the graph
xlabel('Time (s)');
ylabel('Amplitude');
title('Adaptive Delta Modulation Output vs Original Signal');
legend('ADM Output', 'Original Signal');
grid on;

function ADMout = adeltamod(x,Delta,td,ts)
    N = round(ts/td); sum = 0; cnt1 = 0; cnt2 = 0;
    ADMout = zeros(size(x)); % Initialize ADM output with the same size as x
    xsig = downsample(x,N); % Subsampling the input signal
    for i = 1:length(xsig)
        if xsig(i) > sum
            sum = sum + Delta * min(2^cnt1, 8);
            cnt1 = cnt1 + (sum < xsig(i)); cnt2 = 0;
        else
            sum = sum - Delta * min(2^cnt2, 8);
            cnt2 = cnt2 + (sum > xsig(i)); cnt1 = 0;
        end
        ADMout((i-1)*N+1:min(i*N, length(x))) = sum; % Fill ADMout properly
    end
end
