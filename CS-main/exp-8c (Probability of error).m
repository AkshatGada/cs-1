% The probability of error, for equally likely data, with AWGN and matched filter
E = 0:1:25; % Eb/N0 = SNR of the received signal

% Unipolar NRZ
P1 = (1/2) * erfc(sqrt(E/2));

% Polar NRZ and Manchester code have the same Pe for equiprobable 1's and 0's
P2 = (1/2) * erfc(sqrt(E));

% Bipolar RZ / RZ-AMI
P3 = (3/4) * erfc(sqrt(E/2));

E_dB = 10 * log10(E); % SNR in dB

figure;
semilogy(E_dB, P1, '-k', E_dB, P2, '-r', E_dB, P3, '-b', 'LineWidth', 2);
legend('Unipolar NRZ', 'Polar NRZ and Manchester', 'Bipolar RZ / RZ-AMI', 'Location', 'best');
xlabel('SNR per bit, Eb/No (dB)');
ylabel('Bit error probability Pe');
title('Bit Error Probability for Different Digital Communication Schemes in AWGN');
grid on;
